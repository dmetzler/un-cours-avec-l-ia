// ============================================================
//  Tutoriel — Comment utiliser le template
//  Destinataire : enseignant·e de SVT collège, débutant en Typst
// ============================================================

#import "@preview/modele-cours-st-jacques:0.1.0": *

#show: course-template.with(
  title: "Tutoriel — Template de cours illustré",
  author: "Guide d'utilisation",
  eyebrow: "GUIDE PRATIQUE",
  cover-title: [Créer ses cours \ avec ce template],
  cover-subtitle: "Un tutoriel pas-à-pas pour enseignants",
  cover-metadata: "Aucune connaissance technique préalable requise",

  // FigureLabs Prompt: Typst Pedagogy & The Art of the Page: Journal cover, 3D rendering, highlight moment. A wooden teacher's desk at the magical hour — captured mid-creation as a beautifully typeset book page materializes in mid-air just above the desk surface, floating with subtle motion blur as if just printed by light itself. The page shows a clean scientific layout: a bold blue chapter heading underlined with a glowing cyan rule, body paragraphs of crisp serif text, and three colored callout blocks (one cobalt blue marked "Définition", one amber marked "À retenir", one rose marked "Analogie") with their characteristic left-edge color bars catching the light. Below the floating page, the same content is shown earlier in its journey: a parchment-textured scroll of raw Typst source code (visible tokens like #show, heading, #def[...], rgb("#1e40af") rendered in muted syntax-highlighting colors) being lifted by delicate streams of golden particles that transform mid-air into the polished page above — code becoming layout. To one side of the desk: an open biology textbook with a half-drawn schema of a cell, a fountain pen resting on handwritten lesson notes in French, a small brass microscope, and a steaming porcelain cup of tea. On the other side: a brass compass, a vintage drafting ruler, and stacked notebooks suggesting craft and care. The background fades into a softly out-of-focus classroom at dusk — chalkboard with faint diagram traces, tall windows with warm amber late-afternoon light streaming in, dust motes suspended in the light beams. Dramatic volumetric lighting from the upper-left window casting a warm honeyed glow across the central floating page, with subtle cool blue accents from an unseen screen suggesting the modern digital craft. Particles of paper fiber and golden light suspended in the foreground, slightly out of focus. Composition: floating typeset page as hero centerpiece, code scroll transforming beneath it as the narrative arc, teacher's tools framing the scene as context. Craft, scholarship, the meeting of code and pedagogy. Renaissance-workshop-meets-modern-typography mood. Warm earth tones contrasting with crisp document blues and ambers, cinematic depth, shallow focus. Portrait orientation (3:4). NO TEXT readable as sentences on the image — typography elements should read as shape and color, not legible content.


  // cover-background: image("schemas/tutorial-cover.png", width: 100%, height: 100%, fit: "cover"),
  show-toc: true,
)


// ============================================================
// CHAPITRE 1 — Bienvenue
// ============================================================
= Bienvenue !

Ce template vous permet de produire des supports de cours illustrés
— comme une fiche de révision pour vos élèves — avec une mise en page
professionnelle, sans avoir à vous battre avec un logiciel de
traitement de texte.

#def[
  *Typst* — un système moderne de mise en page de documents. On y écrit
  le contenu dans un fichier texte (avec quelques balises), et un
  programme génère un *PDF prêt à imprimer ou à distribuer*. C'est un
  peu comme LaTeX, mais beaucoup plus simple à apprendre.
]

#key[
  Ce que vous allez gagner :

  - Des cours avec une *présentation cohérente* d'un document à l'autre.
  - Des *encarts colorés* (définition, à retenir, attention…) en une
    seule ligne de code.
  - Un *sommaire automatique* qui se met à jour tout seul.
  - Une *couverture illustrée* avec image de fond.
  - Des fichiers *légers, versionnables*, qui ne se cassent pas quand
    on les ouvre sur une autre machine.
]

== Comment ça marche en deux mots

Vous écrivez votre cours dans un fichier `.typ` (du texte simple). Ce
fichier *importe le template*, qui contient toute la mise en forme.
Vous lancez ensuite la compilation et obtenez un PDF.

#analogy[
  Imaginez que le template, c'est le *cahier vierge avec les marges,
  les couleurs et les en-têtes déjà imprimés*. Vous, vous écrivez le
  contenu — vous ne refaites pas la mise en page à chaque fois.
]

// ============================================================
// CHAPITRE 2 — Installation
// ============================================================
= Installer Typst (une seule fois)

Il existe deux façons d'utiliser Typst. Choisissez celle qui vous
convient le mieux.

== Option A : en ligne, sans rien installer (recommandée pour démarrer)

Allez sur *typst.app*, créez un compte gratuit, et créez un nouveau
projet. Téléversez `main.typ` et vos images. Le modèle est importé
automatiquement depuis Typst Universe — vous n'avez aucun fichier de
template à charger. L'aperçu PDF s'affiche à droite, en temps réel.

#key[
  C'est l'option la plus simple pour démarrer. *Aucune installation*,
  ça marche depuis n'importe quel ordinateur, on partage un projet à
  plusieurs comme dans Google Docs.
]

== Option B : sur votre ordinateur

Si vous préférez travailler hors-ligne :

+ Téléchargez Typst sur *github.com/typst/typst/releases* (choisissez
  la version pour votre système : Windows, macOS, Linux).
+ Installez l'extension *Tinymist Typst* dans l'éditeur de texte VS
  Code (gratuit) — vous aurez l'aperçu en direct, comme dans Word.
+ Placez `main.typ` dans le même dossier que vos images, ouvrez
  `main.typ`, et c'est parti. Typst téléchargera le modèle depuis
  Universe au premier compile.

#warn[
  Pour cette option, il faut installer un éditeur de texte (VS Code).
  Si vous n'êtes pas à l'aise avec ce genre de manipulation, l'option
  A est plus rapide pour débuter.
]

// ============================================================
// CHAPITRE 3 — Structure d'un cours
// ============================================================
= La structure d'un cours

Tous vos cours auront la même ossature. Le fichier `main.typ` commence
toujours par les *trois lignes magiques* suivantes :

```typ
#import "@preview/modele-cours-st-jacques:0.1.0": *

#show: course-template.with(
  title: "Mon cours",
)
```

#def[
  - La première ligne *importe* tout ce qui se trouve dans le template
    (les couleurs, les encarts, la couverture, etc.).
  - La seconde ligne *applique* le template à tout ce qui suit. C'est
    cette ligne qui crée la couverture, le sommaire, et qui met en
    forme vos titres.
]

Après ces lignes, vous écrivez votre cours librement.

== Les paramètres de la couverture

Tout se règle dans le `course-template.with(...)`. Voici les
paramètres disponibles :

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.5pt + c-gray-light,
  inset: 6pt,
  table.header(
    table.cell(fill: c-blue)[#text(fill: white, weight: "bold", font: "DejaVu Sans")[Paramètre]],
    table.cell(fill: c-blue)[#text(fill: white, weight: "bold", font: "DejaVu Sans")[À quoi ça sert]],
  ),
  cat-cell[`title`], [Titre du document (apparaît dans les métadonnées du PDF, l'onglet du navigateur, etc.)],
  cat-cell[`author`], [Votre nom (dans les métadonnées du PDF).],
  cat-cell[`eyebrow`], [Petit texte en haut de la couverture, en majuscules espacées. Ex. `"SVT — 3e"`.],
  cat-cell[`cover-title`], [Le grand titre de la couverture. Utilisez `\` pour faire un saut de ligne.],
  cat-cell[`cover-subtitle`], [Phrase d'accroche en italique, en bas de la couverture.],
  cat-cell[`cover-metadata`], [Ligne plus discrète tout en bas (votre nom, le contexte, la classe…)],
  cat-cell[`cover-background`], [Image de fond de la couverture. Doit être passée comme contenu image, ex. `image("ma_image.png", width: 100%, height: 100%, fit: "cover")`.],
  cat-cell[`show-toc`], [Mettre `false` si vous ne voulez pas de sommaire.],
  cat-cell[`toc-title`], [Titre du sommaire. Par défaut : `"Sommaire"`.],
)

#ex[
  Voici un exemple complet pour un cours de 4e sur la respiration :

  ```typ
  #show: course-template.with(
    title: "SVT 4e — La respiration",
    author: "Mme Dupont",
    eyebrow: [SVT — 4#super[e]],
    cover-title: [La respiration \ et la circulation],
    cover-subtitle: "Comment le dioxygène arrive aux cellules",
    cover-metadata: "Cours du chapitre 3 · Collège Saint-Jacques",
    cover-background: image("poumons.jpg",
      width: 100%, height: 100%, fit: "cover"),
  )
  ```
]

== Et si je ne veux pas de couverture ?

Très simple : *n'indiquez ni `cover-title` ni `cover-background`*. Le
template détecte l'absence des deux et démarre directement par le
sommaire (ou par le contenu, si `show-toc: false`).

// ============================================================
// CHAPITRE 4 — Écrire du contenu
// ============================================================
= Écrire du contenu : la syntaxe Typst de base

Bonne nouvelle : la syntaxe Typst est très proche de celle qu'on
utilise déjà naturellement dans les emails ou sur les forums.

== Les titres

Vous écrivez vos titres avec le signe `=`. Plus il y en a, plus le
titre est petit :

#code-example[
```typ
= Chapitre principal

== Sous-partie

=== Sous-sous-partie

Texte normal du paragraphe.
```
][
  #set text(size: 9pt)
  *I. Chapitre principal* \
  _(passe à une nouvelle page, grand titre bleu)_ \
  \
  *1. Sous-partie* \
  _(barre verticale à gauche)_ \
  \
  *1.1) Sous-sous-partie* \
  \
  Texte normal du paragraphe.
]

#key[
  Les titres de niveau 1 (`=`) déclenchent automatiquement un *saut de
  page* et apparaissent dans le sommaire. Pas besoin de gérer les
  pages manuellement.
]

== Mettre en forme du texte

#code-example[
```typ
Voici du texte avec un mot
*en gras*, un mot _en italique_,
et un mot `en monospace`.
```
][
  #set text(size: 9.5pt)
  Voici du texte avec un mot *en gras*, un mot _en italique_, et un
  mot `en monospace`.
]

== Listes à puces et listes numérotées

#code-example[
```typ
- Premier élément
- Deuxième élément
- Troisième élément

+ Étape 1
+ Étape 2
+ Étape 3
```
][
  #set text(size: 9.5pt)
  - Premier élément
  - Deuxième élément
  - Troisième élément

  + Étape 1
  + Étape 2
  + Étape 3
]

#warn[
  Attention : il faut une *ligne vide* avant et après une liste, et
  un *espace* entre `-` ou `+` et le texte. Sinon Typst ne reconnaît
  pas la liste.
]

// ============================================================
// CHAPITRE 5 — Les encarts colorés
// ============================================================
= Les encarts colorés (votre boîte à outils)

C'est le cœur de ce template : six types d'encarts pour structurer
votre cours visuellement. Ils s'écrivent tous de la même façon :

```typ
#nom-de-l'encart[
  Le contenu de l'encart, sur une ou plusieurs lignes.
]
```

#warn[
  *N'oubliez pas le `#`* devant le nom de l'encart, et *les crochets
  `[ ]`* autour du contenu. Sans ça, Typst affichera le code brut au
  lieu d'interpréter la commande.
]

== Définition (`#def`)

Pour les définitions de vocabulaire — c'est l'encart bleu.

#code-example[
```typ
#def[
  *Photosynthèse* — processus
  par lequel les plantes
  fabriquent leur matière.
]
```
][
  #def[
    *Photosynthèse* — processus par lequel les plantes fabriquent leur
    matière.
  ]
]

== À retenir (`#key`)

Pour les points essentiels à mémoriser — c'est l'encart jaune/ambre.

#code-example[
```typ
#key[
  La photosynthèse a besoin
  de lumière, d'eau et de CO₂.
]
```
][
  #key[
    La photosynthèse a besoin de lumière, d'eau et de CO₂.
  ]
]

== Attention (`#warn`)

Pour les pièges fréquents, les confusions à éviter — c'est l'encart
rouge.

#code-example[
```typ
#warn[
  Ne pas confondre respiration
  et photosynthèse !
]
```
][
  #warn[
    Ne pas confondre respiration et photosynthèse !
  ]
]

== Exemple concret (`#ex`)

Pour illustrer une notion abstraite par un exemple de la vie courante
— c'est l'encart vert.

#code-example[
```typ
#ex[
  Quand tu coupes une plante
  d'intérieur, elle continue
  de pousser tant qu'elle a
  de la lumière.
]
```
][
  #ex[
    Quand tu coupes une plante d'intérieur, elle continue de pousser
    tant qu'elle a de la lumière.
  ]
]

== Analogie (`#analogy`)

Pour les comparaisons avec la vie courante qui aident à comprendre —
c'est l'encart rose, en italique.

#code-example[
```typ
#analogy[
  La chlorophylle, c'est comme
  un panneau solaire végétal.
]
```
][
  #analogy[
    La chlorophylle, c'est comme un panneau solaire végétal.
  ]
]

== Clé de compréhension (`#keyhint`)

Pour les "déclics" — un schéma mental qui éclaire toute la notion.
C'est l'encart violet.

#code-example[
```typ
#keyhint[
  Les plantes sont les seuls
  êtres vivants capables de
  fabriquer leur propre matière.
]
```
][
  #keyhint[
    Les plantes sont les seuls êtres vivants capables de fabriquer
    leur propre matière.
  ]
]

#key[
  *Récapitulatif des six encarts :*

  - `#def[...]` → définition (bleu)
  - `#key[...]` → à retenir (ambre)
  - `#warn[...]` → attention (rouge)
  - `#ex[...]` → exemple concret (vert)
  - `#analogy[...]` → analogie (rose, italique)
  - `#keyhint[...]` → clé de compréhension (violet)
]

// ============================================================
// CHAPITRE 6 — Images et schémas
// ============================================================
= Insérer une image ou un schéma

Pour insérer un schéma avec une légende centrée :

```typ
#schema(image("mon_image.jpg", width: 100%),
  [Schéma 1 — Coupe transversale d'une feuille])
```

#def[
  *Comment ça marche :*

  - Le *premier argument* est l'image (résultat de `image("…")`).
    Le fichier doit se trouver dans le même dossier que `main.typ`.
  - Le *second argument* est la légende qui s'affichera sous l'image,
    en italique gris. Notez les crochets `[ ]` qui entourent la
    légende.
]

== Format d'image accepté

Typst lit les formats *PNG, JPG, SVG, GIF, WEBP*. Pour des schémas
scientifiques, le SVG est idéal (il reste net à toutes les tailles).
Pour des photos, JPG ou PNG.

== Empêcher le saut de page automatique

Par défaut, `#schema` insère un *saut de page* avant le schéma pour
qu'il ait toute la place. Si vous voulez qu'il reste collé à votre
texte, ajoutez `breakpage: false` :

```typ
#schema(image("petit_schema.png", width: 100%),
  [Légende],
  breakpage: false)
```

#key[
  - Utilisez `breakpage: false` pour les *petits schémas* qui viennent
    illustrer un paragraphe.
  - Laissez le comportement par défaut (saut de page) pour les
    *grands schémas* qui méritent une pleine page.
]

== Où trouver des schémas ?

#ex[
  - *Wikimedia Commons* propose des milliers de schémas scientifiques
    libres de droits (cellules, organes, cycles biologiques…).
  - L'outil *FigureLabs* permet de créer des schémas pédagogiques à l'aide d'un
    prompt d'IA (version gratuite limitée mais 50 nouveaux crédits tous les jours)
  - L'outil *BioRender* permet de créer des schémas pédagogiques
    propres (version gratuite limitée mais suffisante).
  - Vous pouvez aussi *scanner vos propres schémas* dessinés à la main
    et les insérer en image.
]

// ============================================================
// CHAPITRE 7 — Tableaux
// ============================================================
= Les tableaux

Les tableaux sont un peu plus techniques, mais une fois que vous avez
le modèle, vous pouvez le copier-coller. Voici un tableau simple à
deux colonnes :

```typ
#table(
  columns: (auto, 1fr),
  align: left,
  stroke: 0.5pt + c-gray-light,
  inset: 6pt,
  head[Terme][Définition]
  ),
  cat-cell[Cellule], [Unité de base du vivant.],
  cat-cell[Tissu],   [Ensemble de cellules de même type.],
  cat-cell[Organe],  [Ensemble de tissus formant une structure.],
)
```

Voici le rendu :

#table(
  columns: (auto, 1fr),
  align: left,
  stroke: 0.5pt + c-gray-light,
  inset: 6pt,
  head[Terme][Définition],
  cat-cell[Cellule], [Unité de base du vivant.],
  cat-cell[Tissu],   [Ensemble de cellules de même type.],
  cat-cell[Organe],  [Ensemble de tissus formant une structure.],
)

== Comprendre les éléments du tableau

#def[
  - `columns: (auto, 1fr)` — il y a deux colonnes. `auto` veut dire
    "ajuste-toi au contenu" ; `1fr` veut dire "prends toute la place
    restante". Pour trois colonnes égales, écrivez
    `columns: (1fr, 1fr, 1fr)`.
  - `inset: 6pt` — l'espace intérieur des cellules.
  - `head` — la première ligne (en-tête bleu, texte blanc).
  - `cat-cell[...]` — une cellule de "catégorie" avec fond orange.
    Utilisez-la pour la première colonne quand vous voulez la mettre
    en valeur.
]

== Recette : ajouter une ligne

Pour chaque nouvelle ligne, vous ajoutez autant de cellules que vous
avez de colonnes. Pas besoin d'écrire `table.row(...)` ou de séparateur
spécial — Typst remplit les colonnes dans l'ordre.

#warn[
  Si votre tableau s'affiche mal, vérifiez que *le nombre de cellules
  est bien un multiple du nombre de colonnes*. Une cellule oubliée et
  toute la grille se décale.
]

// ============================================================
// CHAPITRE 8 — Auto-test (QCM)
// ============================================================
= Créer un auto-test (QCM ou questions ouvertes)

À la fin de vos cours, vous pouvez ajouter un mini contrôle de
connaissances grâce à la commande `#qcm-q(...)`.

== Question avec choix multiple

#code-example[
```typ
#qcm-q(1,
  [Quel organe filtre le sang ?],
  options: (
    [Le cœur],
    [Le rein],
    [Le foie],
  )
)
```
][
  #qcm-q(1,
    [Quel organe filtre le sang ?],
    options: (
      [Le cœur],
      [Le rein],
      [Le foie],
    )
  )
]

== Question vrai/faux

Même principe, avec seulement deux options :

#code-example[
```typ
#qcm-q(2,
  [Le cœur est un muscle.],
  options: ([Vrai], [Faux])
)
```
][
  #qcm-q(2,
    [Le cœur est un muscle.],
    options: ([Vrai], [Faux])
  )
]

== Question ouverte avec lignes pour répondre

Pour une question à réponse libre, utilisez `lines:` au lieu de
`options:` pour préciser le nombre de lignes pointillées que vous
voulez laisser à l'élève :

#code-example[
```typ
#qcm-q(3,
  [Cite les 3 fonctions
  principales du squelette.],
  lines: 3
)
```
][
  #qcm-q(3,
    [Cite les 3 fonctions principales du squelette.],
    lines: 3
  )
]

#key[
  Les *trois paramètres* de `#qcm-q` :

  - Le *numéro de la question* (1, 2, 3…).
  - L'*énoncé*, entre crochets.
  - Au choix : `options: (...)` pour un QCM, *ou* `lines: N` pour des
    lignes vides, *ou* rien du tout pour une question d'observation
    (un schéma à compléter, par exemple).
]

// ============================================================
// CHAPITRE 9 — Compiler
// ============================================================
= Compiler son cours en PDF

C'est l'étape finale : transformer votre fichier `.typ` en PDF
imprimable.

== Sur typst.app (option A)

Rien à faire de spécial : le PDF se génère automatiquement à droite
pendant que vous tapez. Cliquez sur le bouton *"Download PDF"* en haut
à droite quand vous êtes content du résultat.

== Sur votre ordinateur avec VS Code (option B)

Avec l'extension Tinymist installée, ouvrez `main.typ` et appuyez sur
*Ctrl+K puis V* (ou Cmd+K puis V sur Mac). Une fenêtre d'aperçu
s'ouvre à droite et se met à jour en temps réel à chaque
modification. Le PDF est généré dans le dossier, à côté de `main.typ`.

== En ligne de commande (option C, pour les plus à l'aise)

Ouvrez un terminal dans le dossier de votre projet, et tapez :

```
typst compile main.typ
```

Le PDF `main.pdf` apparaît à côté. Pour la compilation continue
(le PDF se met à jour quand vous sauvegardez) :

```
typst watch main.typ
```

// ============================================================
// CHAPITRE 10 — Quand ça ne marche pas
// ============================================================
= Que faire quand ça ne marche pas ?

Voici les *trois erreurs les plus fréquentes* quand on débute, et
comment les régler.

== Erreur 1 : "unknown variable: def"

*Cause probable :* vous avez oublié la ligne `#import "@preview/modele-cours-st-jacques:0.1.0": *`
en haut du fichier.

*Solution :* assurez-vous que les *deux premières lignes utiles* de
`main.typ` sont :

```typ
#import "@preview/modele-cours-st-jacques:0.1.0": *
#show: course-template.with(...)
```

== Erreur 2 : "file not found: cover.png"

*Cause probable :* l'image n'est pas dans le même dossier que `main.typ`.

*Solution :* déplacez votre image dans le bon dossier, ou indiquez le
chemin complet : `cover-background: image("images/cover.png", …)`.

#warn[
  Sur typst.app, vérifiez que *l'image a bien été téléversée* dans le
  projet (panneau de gauche, bouton "Upload"). Une image stockée sur
  votre disque mais pas dans le projet ne sera pas trouvée.
]

== Erreur 3 : Le contenu ne s'affiche pas avec la bonne mise en forme

*Cause probable :* vous avez oublié le `#` devant `def`, `key`, etc.,
ou vous avez utilisé `()` au lieu de `[ ]`.

*Solution :* la syntaxe correcte est :

```typ
#def[Mon contenu ici]
```

Et *pas* :

```typ
def(Mon contenu ici)        // FAUX
#def(Mon contenu ici)       // FAUX
def[Mon contenu ici]        // FAUX
```

#keyhint[
  Mémo : devant chaque commande dans le texte, il faut un *dièse `#`*,
  et le contenu va entre *crochets `[ ]`* (et pas entre parenthèses).
]

== Erreur 4 : Mon sommaire n'affiche que la première partie

*Cause probable :* vous utilisez `==` (deux signes égal) au lieu de
`=` pour vos chapitres principaux.

*Solution :* le sommaire affiche par défaut uniquement les *titres de
niveau 1* (`=`). Les sous-parties (`==`) n'apparaissent pas, c'est
voulu pour garder un sommaire lisible.

// ============================================================
// CHAPITRE 11 — Aller plus loin
// ============================================================
= Pour aller plus loin

Quelques pistes une fois que vous serez à l'aise avec les bases.

== Réutiliser les couleurs du template

Les variables de couleurs du template sont accessibles dans votre
cours. Par exemple, pour un mot en bleu :

```typ
#text(fill: c-blue)[ce mot est bleu]
```

Les couleurs disponibles : `c-blue`, `c-amber`, `c-red`, `c-green`,
`c-pink`, `c-orange`, `c-purple`, `c-gray`, et leurs variantes
`-light`, `-strong`, `-dark`.

== Faire un encart personnalisé

Si vous voulez créer votre propre type d'encart (par exemple un encart
"Activité" en gris) :

```typ
#let activity(body) = callout(
  c-gray, rgb("#e2e8f0"),
  "Activité", body
)
```

Ajoutez cette ligne en haut de votre `main.typ`, juste après
l'import. Ensuite vous pouvez l'utiliser comme les autres :
`#activity[...]`.

== Modifier le template

Le modèle est désormais publié comme package
`@preview/modele-cours-st-jacques` — vous ne pouvez donc plus l'éditer
"sur place". Deux options si vous voulez changer les couleurs par
défaut, la police ou les marges :

+ *Version locale* — récupérez la source du modèle sur
  #link("https://github.com/dmetzler/un-cours-avec-l-ia")[le dépôt GitHub],
  installez-la en `@local/modele-cours-st-jacques/0.1.0` (voir la doc
  Typst sur les packages locaux), puis importez-la avec `@local/...`
  au lieu de `@preview/...`.
+ *Surcharger en haut de votre `main.typ`* — la plupart du temps, vous
  n'avez pas besoin de toucher au modèle. Redéfinissez simplement la
  couleur ou l'encart juste après l'import, par exemple :
  `#let c-blue = rgb("#0066cc")`.

#warn[
  Si vous installez une version locale modifiée, faites-en une *copie
  de sauvegarde*. Si vous cassez quelque chose, vous pourrez toujours
  revenir à `@preview/...` qui reste intact.
]

== Ressources utiles

- *Documentation officielle Typst* : `typst.app/docs` (en anglais).
- *Tutoriel officiel* : `typst.app/docs/tutorial` (très progressif).
- *Forum d'entraide* : `forum.typst.app`.

#key[
  Avec les seules notions de ce tutoriel, vous pouvez déjà produire
  des cours complets et de qualité professionnelle. Tout le reste,
  c'est du bonus !
]

// ============================================================
// ANNEXE — Récapitulatif des commandes
// ============================================================
= Annexe — Aide-mémoire

Imprimez cette page et gardez-la à portée de main.

== Structure de base

```typ
#import "@preview/modele-cours-st-jacques:0.1.0": *
#show: course-template.with(
  title: "...",
  cover-title: [...],
  cover-background: image("image.jpg", width: 100%, height: 100%, fit: "cover"),
)

= Mon premier chapitre
== Sous-partie
=== Sous-sous-partie
```

== Mise en forme

#table(
  columns: (auto, 1fr),
  align: left,
  stroke: 0.5pt + c-gray-light,
  inset: 6pt,
  head[Syntaxe][Effet],
  
  cat-cell[`*texte*`], [Gras],
  cat-cell[`_texte_`], [Italique],
  cat-cell[#raw("`texte`")], [Monospace (police machine à écrire)],
  cat-cell[`- élément`], [Liste à puces],
  cat-cell[`+ élément`], [Liste numérotée],
  cat-cell[`\`], [Saut de ligne forcé],
)

== Les six encarts

#table(
  columns: (auto, 1fr),
  align: left,
  stroke: 0.5pt + c-gray-light,
  inset: 6pt,
  head[Commande][Quand l'utiliser],
  cat-cell[`#def[...]`],     [Définir un terme de vocabulaire],
  cat-cell[`#key[...]`],     [Point essentiel à retenir],
  cat-cell[`#warn[...]`],    [Confusion fréquente, attention],
  cat-cell[`#ex[...]`],      [Exemple concret de la vie courante],
  cat-cell[`#analogy[...]`], [Comparaison qui aide à comprendre],
  cat-cell[`#keyhint[...]`], [Clé de compréhension globale],
)

== Schémas, tableaux, questions

```typ
#schema(image("image.jpg", width: 100%), [Légende sous le schéma])
#schema(image("image.jpg", width: 100%), [Légende], breakpage: false)

#qcm-q(1, [Énoncé], options: ([A], [B], [C]))
#qcm-q(2, [Énoncé], lines: 3)
```

#v(15pt)

#block(
  fill: c-green-bg,
  stroke: (left: 4pt + c-green-strong),
  inset: 12pt,
  radius: 3pt,
  width: 100%,
)[
  #align(center)[
    #text(font: "DejaVu Sans", size: 12pt, weight: "bold", fill: c-green)[
      Bonne rédaction de vos cours !
    ]
  ]
  #v(4pt)
  #align(center)[
    #text(size: 10pt, fill: c-green, style: "italic")[
      N'hésitez pas à expérimenter — c'est en pratiquant qu'on
      apprivoise l'outil.
    ]
  ]
]
