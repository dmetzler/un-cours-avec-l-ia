// Test minimal : vérifie que tous les helpers exposés par lib.typ
// sont importables et compilent. Utilisé par la CI.

#import "/lib.typ": *

#show: course-template.with(
  title: "Smoke test",
  author: "CI",
  eyebrow: [TEST],
  cover-title: [Smoke test],
  cover-subtitle: "CI",
  cover-metadata: [test],
  show-toc: false,
)

= Chapitre I

Un peu de texte avec une #strong[mise en valeur].

#def[Une définition.]
#key[À retenir.]
#warn[Attention.]
#ex[Exemple concret.]
#analogy[Analogie.]
#keyhint[Clé de compréhension.]
#atelier[Zone d'atelier.]

#qcm-q(1, [Question test ?], options: ("A", "B", "C"), lines: 2)

#fig(
  rect(width: 60pt, height: 30pt, fill: c-blue-light, stroke: 0.5pt),
  [Figure inline test],
)

#table(
  columns: 2,
  head[Colonne A][Colonne B],
  cat-cell[Catégorie], [valeur],
)
