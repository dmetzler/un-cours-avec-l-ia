// ============================================================
//  Mathématiques 3e — Le théorème de Pythagore
//  EXEMPLE « ALLER PLUS LOIN » (pour les profs de maths)
//  Montre : la notation mathématique de Typst (équations) et
//  les schémas vectoriels exacts avec CETZ.
// ============================================================

#import "@preview/modele-cours-st-jacques:0.1.0": *
#import "@preview/cetz:0.4.2"

#show: course-template.with(
  title: "Mathématiques 3e — Le théorème de Pythagore",
  author: "Exemple d'atelier",

  eyebrow: [MATHÉMATIQUES — 3#super[e]],
  cover-title: [Le théorème \ de Pythagore],
  cover-subtitle: "Équations et figures, écrites en Typst + CETZ",
  cover-metadata: [Exemple « aller plus loin » · Cycle 4],

// Prompt of the cover (Nano Banana)
//   A vibrant, cinematic illustration in a fun, slightly tongue-in-cheek style,
// portrait format 3:4, with a luminous open sky at the top.Subject: Pythagoras, an ancient Greek mathematician — white toga, olive-leafcrown, short curly grey beard, friendly confident grin — standing heroically inthe Egyptian desert at golden hour. He proudly holds up, like a trophy, a largeglowing turquoise right-angled triangle (a clean 3-4-5 triangle) that emits softlight.Background: the Great Pyramids of Giza, their triangular faces echoing histriangle; warm sand dunes, a couple of palm trees, a golden sky with soft sunrays. At his feet, a knotted rope with 13 knots lies in the sand, bent into a perfect right triangle.Mood: joyful, epic but playful, a wink of humour — like a movie poster for thehero of geometry. Warm desert palette (sand, gold, terracotta) with a pop ofglowing turquoise from the triangle.Composition: character centered in the lower two-thirds, plenty of open sky atthe top for a title. Soft cinematic light from the upper-left, gentle depth offield. NO TEXT anywhere in the image.
  cover-background: image("pythagore.png", width: 100%, height: 100%, fit: "cover"),

  show-toc: true,
  toc-title: "Sommaire",
)

// ============================================================
= Le théorème de Pythagore

#def[
  Un *triangle rectangle* est un triangle qui possède un angle droit. Le côté
  opposé à l'angle droit — le plus long — s'appelle l'*hypoténuse*.
]

#fig(
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (4, 0)
    let C = (0, 3)
    line(A, B, C, close: true, stroke: 1.2pt + rgb("#1e3a8a"))
    // marque d'angle droit en A
    line((0.45, 0), (0.45, 0.45), (0, 0.45), stroke: 0.8pt)
    // sommets
    content((-0.35, -0.35), text(weight: "bold")[$A$])
    content((4.35, -0.35), text(weight: "bold")[$B$])
    content((-0.35, 3.25), text(weight: "bold")[$C$])
    // côtés
    content((2, -0.55), [$c$])
    content((-0.5, 1.5), [$b$])
    content((2.5, 1.9), text(fill: rgb("#1e40af"))[hypoténuse])
  }),
  [Triangle rectangle en $A$ : l'hypoténuse $[B C]$ est opposée à l'angle droit.],
)

#key[
  Dans un triangle rectangle, le carré de l'hypoténuse est égal à la somme des
  carrés des deux autres côtés :
  $ B C^2 = A B^2 + A C^2 $
]

== Calculer une longueur

On considère un triangle rectangle en $A$ tel que $A B = 4 thin "cm"$ et
$A C = 3 thin "cm"$. Calculons la longueur de l'hypoténuse $B C$.

$ B C^2 &= A B^2 + A C^2 \
        &= 4^2 + 3^2 \
        &= 16 + 9 = 25 $

L'hypoténuse est une longueur, donc positive : $B C = sqrt(25) = 5 thin "cm"$.

#ex[
  Le triangle « 3 – 4 – 5 » est le plus célèbre des triangles rectangles. On
  l'utilise sur les chantiers pour tracer un angle droit avec une simple *corde à
  13 nœuds* (12 intervalles égaux : 3 + 4 + 5).
]

// ============================================================
= La réciproque du théorème

Le théorème permet de calculer une longueur quand on *sait* que le triangle est
rectangle. La *réciproque* fait l'inverse : elle permet de *démontrer* qu'un
triangle est rectangle.

#key[
  Si, dans un triangle, le carré du plus grand côté est égal à la somme des
  carrés des deux autres côtés, alors ce triangle est *rectangle*, et son plus
  grand côté est l'hypoténuse.
]

== Exemple

Un triangle $A B C$ a pour côtés $A B = 6 thin "cm"$, $A C = 8 thin "cm"$ et
$B C = 10 thin "cm"$. Est-il rectangle ?

On compare le carré du plus grand côté à la somme des carrés des deux autres :

$ B C^2 = 10^2 = 100 $

$ A B^2 + A C^2 = 6^2 + 8^2 = 36 + 64 = 100 $

Les deux résultats sont *égaux*. D'après la réciproque du théorème de Pythagore,
le triangle $A B C$ est *rectangle en $A$*.

#warn[
  On compare toujours le carré du *plus grand* côté à la somme des carrés des
  deux autres. Si les deux résultats sont *différents*, le triangle n'est pas
  rectangle.
]

// ============================================================
= Une application : l'échelle contre le mur

Une échelle de $5 thin "m"$ est appuyée contre un mur vertical. Son pied est posé
à $3 thin "m"$ du mur. À quelle hauteur l'échelle touche-t-elle le mur ?

#fig(
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // sol
    line((-0.5, 0), (4.5, 0), stroke: 1pt)
    // mur
    line((0, 0), (0, 4.4), stroke: 1.2pt)
    // hachures du mur
    for i in range(0, 6) {
      line((0, i * 0.7), (-0.3, i * 0.7 - 0.3), stroke: 0.5pt + c-gray)
    }
    // échelle (hypoténuse)
    line((3, 0), (0, 4), stroke: 2pt + rgb("#1e40af"))
    // angle droit
    line((0.4, 0), (0.4, 0.4), (0, 0.4), stroke: 0.8pt)
    // légendes
    content((1.5, -0.5), [$3 thin "m"$])
    content((-0.75, 2), text(fill: c-gray)[hauteur $h$], angle: 90deg)
    content((2.15, 2.55), text(fill: rgb("#1e40af"), weight: "bold")[$5 thin "m"$])
  }),
  [Le mur, le sol et l'échelle forment un triangle rectangle ; l'échelle en est l'hypoténuse.],
)

En notant $h$ la hauteur cherchée, le triangle est rectangle et l'échelle est son
hypoténuse. D'après le théorème de Pythagore :

$ h^2 + 3^2 &= 5^2 \
        h^2 &= 25 - 9 \
        h^2 &= 16 $

Donc $h = sqrt(16) = 4 thin "m"$. L'échelle touche le mur à *4 mètres* de hauteur.

#keyhint[
  La démarche est toujours la même : repérer le triangle rectangle, identifier
  l'hypoténuse, écrire l'égalité de Pythagore, puis isoler la longueur cherchée.
]
