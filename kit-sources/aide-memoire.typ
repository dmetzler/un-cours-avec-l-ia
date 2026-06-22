// kit-sources/aide-memoire.typ
//
// Aide-mémoire 2 pages distribué dans le kit atelier.
// Compilé en CI vers docs/kit/aide-memoire.pdf.

#import "@preview/modele-cours-st-jacques:0.1.0": *

#set document(title: "Aide-mémoire — Atelier")
#set page(
  paper: "a4",
  margin: (top: 18mm, bottom: 18mm, left: 16mm, right: 16mm),
  numbering: "1 / 1",
  number-align: center,
)
#set text(font: "DejaVu Serif", size: 10pt, lang: "fr")
#set par(justify: true, leading: 0.65em)

#show heading.where(level: 1): it => {
  set text(font: "DejaVu Sans", size: 16pt, fill: c-blue-dark, weight: "bold")
  block(below: 6pt)[#it]
  line(length: 100%, stroke: 2pt + c-blue-accent)
  v(4pt)
}
#show heading.where(level: 2): it => {
  set text(font: "DejaVu Sans", size: 11pt, fill: c-blue, weight: "bold")
  v(6pt)
  block(inset: (left: 6pt), stroke: (left: 3pt + c-blue-accent))[#it]
  v(2pt)
}

#set heading(numbering: "1.")

= Aide-mémoire

Gardez cette page à portée de main pendant l'atelier.

== Les trois lignes du début

Tout fichier `main.typ` commence par :

```typ
#import "@preview/modele-cours-st-jacques:0.1.0": *
#show: course-template.with(
  title: "Mon cours",
  cover-title: [Mon titre \ sur deux lignes],
  cover-subtitle: "Une accroche",
  cover-background: image("ma_couverture.png",
    width: 100%, height: 100%, fit: "cover"),
)
```

Puis on écrit le cours librement.

== Titres et mise en forme

#table(
  columns: (auto, 1fr),
  inset: 5pt,
  align: (left, left),
  head[Syntaxe][Effet],
  [`= Titre`],   [Chapitre (nouvelle page, dans le sommaire)],
  [`== Titre`],  [Sous-partie],
  [`=== Titre`], [Sous-sous-partie],
  [`*texte*`],   [*Gras*],
  [`_texte_`],   [_Italique_],
  [`- élément`], [Liste à puces],
  [`+ élément`], [Liste numérotée],
  [`\\`],         [Saut de ligne forcé],
)

== Les encarts colorés

#table(
  columns: (auto, 1fr),
  inset: 5pt,
  align: (left, left),
  head[Commande][Quand l'utiliser],
  [`#def[…]`],     [Définir un mot de vocabulaire],
  [`#key[…]`],     [Point essentiel à retenir],
  [`#warn[…]`],    [Confusion fréquente, attention],
  [`#ex[…]`],      [Exemple concret de la vie courante],
  [`#analogy[…]`], [Comparaison qui aide à comprendre],
  [`#keyhint[…]`], [Clé de compréhension globale],
  [`#atelier[…]`], [Zone à compléter pendant l'atelier],
)

#pagebreak()

== Images, tableaux, questions

```typ
#schema(image("image.png", width: 100%),
        [Légende sous le schéma])

#schema(image("image.png", width: 100%),
        [Légende], breakpage: false)

#qcm-q(1, [Énoncé], options: ([A], [B], [C]))
#qcm-q(2, [Énoncé à rédiger], lines: 3)
```

== Les 3 réflexes en cas d'erreur

#warn[
  - « *unknown variable: def* » → il manque
    `#import "@preview/modele-cours-st-jacques:0.1.0": *` en haut.
  - « *file not found* » → l'image n'est pas téléversée, ou le nom diffère
    (à la lettre près, majuscules comprises).
  - Un encart ne s'affiche pas → il faut `#def[...]` : un dièse `#`
    devant, le contenu entre crochets `[ ]`.
]

#key[
  Avec ces quelques commandes, vous produisez déjà des cours complets et
  soignés. Tout le reste, c'est du bonus.
]
