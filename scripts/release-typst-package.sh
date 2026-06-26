#!/usr/bin/env bash
#
# release-typst-package.sh
#
# Prépare une release du package Typst vers typst/packages.
#
# Usage :
#   scripts/release-typst-package.sh [--fork OWNER/REPO]
#
# --fork peut être :
#   - OWNER/REPO           (ex. dmetzler/typst-packages — fork renommé)
#   - OWNER                (assume OWNER/packages — fork avec nom par défaut)
#
# Étapes :
#   1. Lit nom + version dans package/typst.toml
#   2. Clone (ou rafraîchit) un fork local de typst/packages
#   3. Copie package/ -> packages/preview/<name>/<version>/
#   4. Crée une branche et committe
#   5. Affiche les instructions pour ouvrir la PR
#
# Pré-requis :
#   - typst CLI dans le PATH (pour valider la compilation)
#   - gh CLI authentifié (pour fork + PR ; optionnel)
#   - Avoir forké https://github.com/typst/packages sur ton compte GitHub
#
# Le script ne pousse PAS automatiquement : tu valides à la main avant.

set -euo pipefail

# ─── Config ─────────────────────────────────────────────────
HERE="$(cd "$(dirname "$0")/.." && pwd)"
PACKAGE_DIR="$HERE/package"
WORK_DIR="$HERE/.release-work"
UPSTREAM="https://github.com/typst/packages.git"
FORK_SPEC=""
FORK_OWNER=""
FORK_REPO=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --fork)  FORK_SPEC="$2"; shift 2 ;;
    -h|--help)
      sed -n '2,24p' "$0"; exit 0 ;;
    *) echo "Argument inconnu : $1" >&2; exit 2 ;;
  esac
done

if [[ -n "$FORK_SPEC" ]]; then
  if [[ "$FORK_SPEC" == */* ]]; then
    FORK_OWNER="${FORK_SPEC%%/*}"
    FORK_REPO="${FORK_SPEC##*/}"
  else
    FORK_OWNER="$FORK_SPEC"
    FORK_REPO="packages"
  fi
fi

# ─── Helpers ────────────────────────────────────────────────
say()  { printf '\033[1;34m▶\033[0m %s\n' "$*"; }
ok()   { printf '\033[1;32m✓\033[0m %s\n' "$*"; }
die()  { printf '\033[1;31m✗\033[0m %s\n' "$*" >&2; exit 1; }

need() { command -v "$1" >/dev/null || die "binaire requis manquant : $1"; }

# ─── Validation locale ──────────────────────────────────────
need git
need awk
need typst

[[ -f "$PACKAGE_DIR/typst.toml" ]] || die "introuvable : $PACKAGE_DIR/typst.toml"

NAME=$(awk -F' *= *' '/^name *=/    {gsub(/"/,"",$2); print $2; exit}' "$PACKAGE_DIR/typst.toml")
VERSION=$(awk -F' *= *' '/^version *=/ {gsub(/"/,"",$2); print $2; exit}' "$PACKAGE_DIR/typst.toml")

[[ -n "$NAME"    ]] || die "impossible de lire 'name' dans typst.toml"
[[ -n "$VERSION" ]] || die "impossible de lire 'version' dans typst.toml"

say "Package : $NAME @ $VERSION"

# Smoke test
say "Compilation du smoke test"
typst compile --root "$PACKAGE_DIR" "$PACKAGE_DIR/tests/smoke.typ" /tmp/release-smoke.pdf
ok "Smoke test OK"

# ─── Préparer le clone de typst/packages ────────────────────
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

if [[ ! -d packages/.git ]]; then
  say "Clonage de typst/packages dans $WORK_DIR/packages"
  git clone --depth=1 --no-checkout --filter="tree:0" "$UPSTREAM"  packages

  cd packages
  git sparse-checkout init
  git sparse-checkout set packages/preview/$NAME
  git remote add upstream git@github.com:typst/packages
  git config remote.upstream.partialclonefilter tree:0
  git checkout main
  cd ..

else
  say "Mise à jour du clone existant"
  cd packages
  git fetch origin main --depth=1
  git checkout main
  git reset --hard origin/main
  cd ..
fi

cd packages

# Configurer le fork comme remote si demandé
if [[ -n "$FORK_OWNER" ]]; then
  FORK_URL="git@github.com:$FORK_OWNER/$FORK_REPO.git"
  if git remote get-url fork >/dev/null 2>&1; then
    git remote set-url fork "$FORK_URL"
  else
    git remote add fork "$FORK_URL"
  fi
  ok "Remote 'fork' = $FORK_URL"
fi

# ─── Copier le package ──────────────────────────────────────
DEST="packages/preview/$NAME/$VERSION"

if [[ -d "$DEST" ]]; then
  die "$DEST existe déjà sur main : bump la version dans package/typst.toml"
fi

BRANCH="$NAME-$VERSION"
git checkout -B "$BRANCH"

mkdir -p "$DEST"

# Copie tout sauf le dossier de tests
say "Copie $PACKAGE_DIR -> $DEST (sans tests/)"
rsync -a --exclude='tests/' --exclude='.DS_Store' "$PACKAGE_DIR/" "$DEST/"

# Sanity check : typst doit pouvoir compiler le smoke test
# en pointant vers le nouvel emplacement
SMOKE_TMP=$(mktemp -d)
cat > "$SMOKE_TMP/smoke.typ" <<EOF
#import "@local/$NAME:$VERSION": *
#set page(width: 50pt, height: 50pt)
ok
EOF

LOCAL_PKG="$HOME/.local/share/typst/packages/local/$NAME/$VERSION"
mkdir -p "$LOCAL_PKG"
rsync -a --delete --exclude='tests/' "$PACKAGE_DIR/" "$LOCAL_PKG/"

typst compile "$SMOKE_TMP/smoke.typ" "$SMOKE_TMP/smoke.pdf" \
  || die "Le package installé en @local ne compile pas"
ok "Compilation via @local OK"

# ─── Commit ─────────────────────────────────────────────────
git add "$DEST"
git -c user.name='Release script' -c user.email='release@local' \
  commit -m "$NAME:$VERSION"
ok "Commit créé sur la branche '$BRANCH'"

# ─── Instructions ───────────────────────────────────────────
cat <<EOF

────────────────────────────────────────────────────────────
✓  Préparation terminée.

Clone   : $WORK_DIR/packages
Branche : $BRANCH
Commit  : $(git rev-parse --short HEAD) — $NAME:$VERSION

Prochaines étapes (à la main, après revue) :

  cd $WORK_DIR/packages
  git diff main --stat
EOF

if [[ -n "$FORK_OWNER" ]]; then
  cat <<EOF
  git push fork $BRANCH

  # Ouvre la PR (la branche pousse sur $FORK_OWNER/$FORK_REPO, la PR vise typst/packages) :
  open "https://github.com/typst/packages/compare/main...$FORK_OWNER:$FORK_REPO:$BRANCH?expand=1"

  # …ou via gh (depuis le clone du fork, pas celui-ci) :
  #   gh repo clone $FORK_OWNER/$FORK_REPO /tmp/$FORK_REPO && cd /tmp/$FORK_REPO
  #   git fetch origin $BRANCH && git checkout $BRANCH
  #   gh pr create --repo typst/packages \\
  #       --head $FORK_OWNER:$BRANCH \\
  #       --base main \\
  #       --title "$NAME:$VERSION" \\
  #       --body "New package: $NAME@$VERSION"
EOF
else
  cat <<EOF
  # ajoute ton fork comme remote 'fork' puis pousse :
  git remote add fork git@github.com:<TON_USER>/<TON_REPO>.git
  git push fork $BRANCH
  # ouvre une PR vers typst/packages depuis ton fork
EOF
fi

cat <<EOF
────────────────────────────────────────────────────────────
EOF
