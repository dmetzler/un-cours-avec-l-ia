# Le kit & aller plus loin

Tout ce qu'il faut pour refaire la démarche, seul·e, tranquillement, sur **vos**
cours.

## À télécharger

<div class="grid cards" markdown>

-   :material-folder-zip: **Le kit projet Typst**

    Le modèle, l'exemple, les polices et les images de départ.

    [:material-download: projet-typst.zip](kit/projet-typst.zip)
    · [:material-file-code-outline: source](#source-projet-typst)

-   :material-book-open-variant: **Le tutoriel complet**

    Le guide pas-à-pas pour Typst, sans connaissance technique.

    [:material-download: tutoriel.pdf](kit/tutoriel.pdf)
    · [:material-file-code-outline: source](#source-tutoriel)

-   :material-card-text-outline: **L'aide-mémoire**

    Une page à imprimer avec toute la syntaxe utile.

    [:material-download: aide-memoire.pdf](kit/aide-memoire.pdf)
    · [:material-file-code-outline: source](#source-aide-memoire)

-   :material-file-pdf-box: **La séquence d'exemple**

    Le résultat complet sur les acides, bases et ions.

    [:material-download: exemple_ions.pdf](kit/exemple_ions.pdf)
    · [:material-file-code-outline: source](#source-exemple-ions)

</div>

!!! tip "Pourquoi le lien « source » ?"
    Le PDF, c'est ce que voient vos élèves. La **source `.typ`**, c'est ce
    qui permet de **refaire et adapter** : copiez-la dans votre projet
    [typst.app](https://typst.app), changez le texte, les images, les
    couleurs. C'est plus rapide que de repartir d'une page blanche.

## Refaire chez vous, avec votre cours

La démarche tient en quatre gestes, toujours les mêmes :

1. **Récupérer une matière de départ** — un plan, un Padlet, des photos de manuel.
2. **Faire rédiger la trace écrite** par Gemini (rôle + public + cadre programme).
3. **Générer les schémas** dont vous avez besoin, et une couverture.
4. **Assembler dans le modèle Typst**, puis exporter le PDF.

!!! tip "Commencez petit"
    Pour votre premier cours en autonomie, prenez **un seul chapitre court**.
    Vous gagnerez en confiance bien plus vite qu'en visant une séquence entière.

## D'autres usages de l'IA en classe

La même logique « cadrer → générer → valider » sert à bien d'autres choses :

- générer une **série d'exercices** de difficulté progressive ;
- proposer une **version différenciée** d'un même texte (plus simple, plus dense) ;
- créer un **QCM d'auto-évaluation** corrigé ;
- reformuler une consigne, traduire, résumer.

## Adapter un cours existant en Typst

Vous avez déjà un cours rédigé (manuel, polycopié, page web, document Word…)
et vous voulez le passer dans le modèle pour en faire un PDF propre ?
Donnez votre cours à une IA — Claude, Gemini ou Perplexity (Perplexity
est particulièrement utile si vous voulez d'abord *sourcer* sur le
programme officiel) — avec le prompt ci-dessous. L'IA convertit votre
texte en code Typst en utilisant **le vocabulaire exact** du modèle, sans
inventer de nouveaux encarts.

!!! tip "Pourquoi ce prompt est volontairement minimal"
    L'IA a tendance, dès qu'on parle de Typst, à inventer ses propres
    `#let` (nouveaux encarts, nouvelles couleurs, ses propres
    helpers…). Le prompt fait l'inverse : il **interdit** toute invention
    et **liste exhaustivement** les helpers disponibles. Résultat : un
    code qui compile du premier coup avec `coquille-st-jacques`.

Le prompt à copier (collez votre cours à la fin) :

```text title="prompts/conversion-typst.txt"
--8<-- "prompts/conversion-typst.txt"
```

**Une fois la réponse récupérée** : créez un nouveau projet sur
typst.app (via Universe : *Start from template* → *coquille-st-jacques*),
ouvrez `main.typ`, et **remplacez le corps** (à partir du premier
`= Chapitre`) par ce que l'IA vous a généré. Ajustez le `title`,
l'`eyebrow` et le `cover-title` dans le préambule du modèle, et vous
avez votre cours.

!!! warning "L'IA propose, vous validez (toujours)"
    Comme pendant l'atelier : relisez le résultat avant de l'imprimer.
    Vérifiez surtout les **définitions** (un terme peut être mal
    caractérisé), les **équations** (une parenthèse oubliée casse tout)
    et les **niveaux de titre** (un chapitre rétrogradé en sous-partie
    disparaît du sommaire).

## Aller plus loin : maths, équations, figures géométriques

Typst gère nativement la **notation mathématique** (équations, racines,
indices, exposants…) et s'enrichit d'extensions pour les **figures
vectorielles exactes**, comme la bibliothèque
[CETZ](https://cetz-package.github.io/) — pratique pour les triangles,
cercles, courbes, schémas géométriques.

[:material-file-pdf-box: Exemple : le théorème de Pythagore (PDF)](kit/exemple_maths.pdf){ .md-button }
[:material-file-code-outline: Source `.typ`](#source-exemple-maths){ .md-button }

Cet exemple, rédigé pour une classe de 3ᵉ, montre comment combiner :

- des **équations** alignées (calcul d'hypoténuse, vérification de la réciproque) ;
- des **figures vectorielles** dessinées en CETZ (triangle annoté,
  échelle contre un mur) — toujours nettes à l'impression, modifiables
  à la main, sans logiciel de dessin séparé ;
- les encarts du modèle (`#def`, `#key`, `#warn`, `#ex`, `#keyhint`)
  pour structurer la démonstration.

## Sources des exemples

Toutes les sources `.typ` utilisées pour fabriquer les PDFs ci-dessus
sont **inclues ici, telles quelles**. Dépliez celle qui vous
intéresse, sélectionnez-la, copiez-la, et collez-la dans votre projet
[typst.app](https://typst.app).

Le code commence toujours par la ligne d'import :

```typ
#import "@preview/coquille-st-jacques:0.1.0": *
```

Le **modèle** est téléchargé automatiquement depuis Typst Universe au
premier compile — vous n'avez aucun fichier de template à embarquer.

### Source : aide-mémoire { #source-aide-memoire }

Fait 2 pages, à imprimer pour les premiers ateliers Typst.

??? note "Voir la source `kit-sources/aide-memoire.typ`"

    ```typ
    --8<-- "kit-sources/aide-memoire.typ"
    ```

### Source : exemple ions { #source-exemple-ions }

Le résultat complet de l'atelier (séquence physique-chimie 3ᵉ sur les
acides, bases et ions). C'est le `main.typ` du **kit projet** —
nécessite aussi les deux images (`cover_ions.png`,
`experience_acide_metal.png`) et le dossier `fonts/`, qui sont dans
le `.zip`.

??? note "Voir la source `projet-typst/main.typ`"

    ```typ
    --8<-- "projet-typst/main.typ"
    ```

### Source : projet Typst (kit complet) { #source-projet-typst }

Le kit ZIP contient `main.typ` (la source ci-dessus), les **images de
départ** (couverture + schéma) et le dossier `fonts/` (polices DejaVu
pour un rendu identique à l'exemple). C'est le format prêt à téléverser
sur typst.app. Le modèle lui-même est téléchargé depuis Typst Universe
au premier compile (`#import "@preview/coquille-st-jacques:0.1.0": *`),
donc il n'est pas dans le zip.

[:material-download: Télécharger projet-typst.zip](kit/projet-typst.zip){ .md-button }

### Source : exemple maths (Pythagore) { #source-exemple-maths }

Exemple « aller plus loin » avec équations et figures vectorielles
CETZ. Nécessite l'image de couverture `pythagore.png`.

??? note "Voir la source `kit-sources/exemple_maths.typ`"

    ```typ
    --8<-- "kit-sources/exemple_maths.typ"
    ```

### Source : tutoriel { #source-tutoriel }

Le tutoriel lui-même est écrit en Typst avec le même modèle.
Source longue — c'est aussi un bon exemple de document structuré.

??? note "Voir la source `kit-sources/tutoriel.typ` (longue, ~860 lignes)"

    ```typ
    --8<-- "kit-sources/tutoriel.typ"
    ```

## Pour creuser Typst

- Le **tutoriel officiel** : [typst.app/docs/tutorial](https://typst.app/docs/tutorial)
- La **documentation** : [typst.app/docs](https://typst.app/docs)

---

!!! success "Bravo"
    Vous savez maintenant fabriquer un support de cours illustré avec l'IA, de la
    page blanche au PDF. Le reste, c'est de la pratique.
