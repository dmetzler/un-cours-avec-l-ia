# Étape 3 — Assembler dans Typst

!!! success "Objectif de l'étape"
    Réunir votre texte et vos deux images dans le modèle, et **exporter un PDF**
    propre, prêt à imprimer.

**Typst** est un outil de mise en page : on écrit le contenu dans un fichier
texte, il fabrique un beau PDF. Tout le style (couleurs, encarts, couverture) est
déjà fait dans le modèle — vous n'avez qu'à **remplir**.

## 1. Ouvrir le projet sur typst.app

1. Allez sur **[typst.app](https://typst.app)** et créez un compte gratuit
   (connexion avec Google possible).
2. Téléchargez le **[kit projet](kit/projet-typst.zip)**, décompressez-le
   (la [source du `main.typ`](06-kit.md#source-exemple-ions) est également
   consultable inline si vous voulez voir le code avant de télécharger).
3. Sur typst.app : **+ Empty project**, puis glissez-déposez **tout le contenu**
   du dossier (`main.typ`, `lib.typ`, le dossier `fonts`, et les images).

!!! note "À propos de `lib.typ`"
    `lib.typ` contient le **modèle** (encarts colorés, page de couverture,
    sommaire…) — c'est ce qu'importe la première ligne de `main.typ` :
    `#import "lib.typ": *`. Vous n'y touchez pas, vous l'embarquez tel quel.

    *À terme*, le modèle sera publié comme package sur Typst Universe et
    `main.typ` commencera par
    `#import "@preview/modele-cours-st-jacques:0.1.0": *` — vous n'aurez plus
    besoin de joindre `lib.typ`. Pour l'instant on l'embarque dans le kit,
    rien à faire de votre côté.

!!! note "Pourquoi le dossier `fonts` ?"
    Il garantit que votre PDF aura **exactement** le même rendu que l'exemple,
    quel que soit l'ordinateur. Ne le supprimez pas.

## 2. Coller votre trace écrite

Ouvrez `main.typ`. Trouvez le chapitre **« Réaction des acides avec les métaux »**
et son encart turquoise **« À construire en atelier »**. **Remplacez l'encart** par
le texte que Gemini a rédigé pour vous.

!!! tip "Le balisage, en 30 secondes"
    | Vous écrivez… | Vous obtenez… |
    |---------------|---------------|
    | `= Titre` | un grand titre de chapitre (nouvelle page) |
    | `== Sous-titre` | une sous-partie |
    | `*gras*` · `_italique_` | du **gras** · de l'*italique* |
    | `#def[…]` | un encart bleu « Définition » |
    | `#key[…]` | un encart « À retenir » |
    | `#warn[…]` | un encart rouge « Attention » |

    L'**[aide-mémoire imprimable](kit/aide-memoire.pdf)** récapitule tout
    ([source](06-kit.md#source-aide-memoire)).

## 3. Brancher vos images

1. Téléversez vos deux images dans le projet (panneau de gauche).
2. Dans `main.typ`, remplacez `cover_ions.png` par le nom de **votre**
   couverture (dans la ligne `cover-background: image("…")`).
3. Remplacez `experience_acide_metal.png` par le nom de **votre** schéma
   (dans le `#schema(image("…"), …)`).

L'aperçu PDF, à droite, se met à jour tout seul.

## 4. Exporter le PDF

Bouton de téléchargement en haut à droite → votre PDF est prêt. 🎉

## Quand ça coince : les 4 erreurs classiques

??? failure "« unknown variable: def »"
    Il manque la première ligne `#import "lib.typ": *` en haut de `main.typ`.

??? failure "« file not found: lib.typ »"
    `lib.typ` n'a pas été téléversé avec les autres fichiers. Re-glissez le
    contenu complet du kit (`main.typ` + `lib.typ` + dossier `fonts` + images)
    dans le projet typst.app.

??? failure "« file not found: … .png »"
    L'image n'est pas téléversée, ou son nom ne correspond pas **à la lettre près**
    (attention aux majuscules et aux espaces).

??? failure "Un encart ne s'affiche pas correctement"
    La bonne syntaxe est `#def[…]` : un **dièse** `#` devant, le contenu entre
    **crochets** `[ ]` (et non entre parenthèses).

??? failure "Le sommaire n'affiche qu'une partie"
    Vos chapitres doivent commencer par **un seul** `=`. Les `==` (sous-parties)
    n'apparaissent pas dans le sommaire, c'est voulu.

!!! note "Pour aller plus loin"
    Le **[tutoriel complet](kit/tutoriel.pdf)** détaille tout, pas à pas. À garder
    sous le coude pour vos prochains cours
    ([source](06-kit.md#source-tutoriel) consultable inline).
