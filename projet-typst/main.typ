// ============================================================
//  Physique-Chimie 3e — Acides, bases et ions
//  EXEMPLE D'ATELIER
//  Le chapitre III (Réaction des acides avec les métaux) est
//  laissé VOLONTAIREMENT en creux : c'est la partie que les
//  participant·es vont construire avec l'IA pendant l'atelier.
// ============================================================

#import "@preview/coquille-st-jacques:0.1.0": *

// ─────────────────────────────────────────────────────────────
//  PROMPT COVER (à coller dans Gemini / Nano Banana — format 3:4)
//  « Génère une image de couverture, format portrait 3:4, style
//  illustration scientifique 3D ludique, fond clair. Scène : un
//  petit personnage "ion" héroïque — une sphère bleue marquée d'un
//  gros signe « + » (cation), cape légère — fait équipe avec une
//  sphère rouge marquée d'un « – » (anion), au milieu d'un bécher
//  géant rempli de liquide turquoise translucide. Autour, des
//  bulles de dihydrogène qui montent, un papier pH coloré déroulé
//  comme une banderole (du rouge au violet), et une petite flamme
//  amicale en haut. Lumière douce venant du haut-gauche, couleurs
//  vives, ambiance "héros de la chimie", profondeur cinématique.
//  AUCUN TEXTE sur l'image. »
// ─────────────────────────────────────────────────────────────

#show: course-template.with(
  title: "Physique-Chimie 3e — Acides, bases et ions",
  author: "Séquence de révision",

  eyebrow: [PHYSIQUE-CHIMIE — 3#super[e]],
  cover-title: [Acides, bases \ et ions],
  cover-subtitle: "Quand la matière se transforme",
  cover-metadata: [Séquence de révision · Cycle 4 · Exemple d'atelier],
  cover-background: image("cover_ions.png", width: 100%, height: 100%, fit: "cover"),

  show-toc: true,
  toc-title: "Sommaire",
)

// ============================================================
// CHAPITRE I
// ============================================================
= Acide, basique ou neutre : le pH

Le jus de citron pique, l'eau savonneuse est glissante, l'eau du
robinet ne fait ni l'un ni l'autre. Pour classer les solutions sans se
fier au goût (ce qu'on ne fait *jamais* au laboratoire !), les chimistes
utilisent une grandeur : le *pH*.

#def[
  *pH* — nombre, généralement compris entre 0 et 14, qui mesure
  l'acidité d'une solution. Il se mesure avec du *papier pH* ou un
  *pH-mètre*.
]

#key[
  - pH *inférieur à 7* → solution *acide*
  - pH *égal à 7* → solution *neutre*
  - pH *supérieur à 7* → solution *basique*

  Plus on s'éloigne de 7, plus la solution est « forte » (très acide ou
  très basique).
]

== Reconnaître une solution avec un indicateur coloré

Un *indicateur coloré* change de couleur selon le pH. Le plus courant
au collège est le *bleu de bromothymol* (BBT) :

#table(
  columns: (1fr, 1fr, 1fr),
  align: (center, center, center),
  stroke: 0.5pt + c-gray-light,
  inset: 7pt,
  head[Solution acide][Solution neutre][Solution basique],
  [BBT *jaune*], [BBT *vert*], [BBT *bleu*],
)

== Ce que le pH raconte sur les ions

Une solution aqueuse contient toujours deux ions « vedettes » : l'ion
*hydrogène* H#super[+] et l'ion *hydroxyde* HO#super[−]. C'est leur
proportion qui fait l'acidité :

#table(
  columns: (1fr, 1.4fr),
  align: (left, left),
  stroke: 0.5pt + c-gray-light,
  inset: 7pt,
  head[Type de solution][Ions majoritaires],
  cat-cell[Acide],   [Beaucoup d'ions H#super[+]],
  cat-cell[Neutre],  [Autant de H#super[+] que de HO#super[−]],
  cat-cell[Basique], [Beaucoup d'ions HO#super[−]],
)

#warn[
  Les solutions acides ou basiques concentrées sont *corrosives* : elles
  attaquent la peau et les yeux. Lunettes, gants et blouse sont
  obligatoires, et on verse *toujours l'acide dans l'eau*, jamais
  l'inverse.
]

== Exemples de la vie courante

#table(
  columns: (1.6fr, 0.8fr, 1fr),
  align: (left, center, left),
  stroke: 0.5pt + c-gray-light,
  inset: 6pt,
  head[Solution][pH environ][Nature],
  cat-cell[Jus de citron], [2], [Acide],
  cat-cell[Vinaigre], [3], [Acide],
  cat-cell[Eau pure], [7], [Neutre],
  cat-cell[Eau de mer], [8], [Légèrement basique],
  cat-cell[Eau savonneuse], [9–10], [Basique],
  cat-cell[Déboucheur (soude)], [13–14], [Très basique],
)

// ============================================================
// CHAPITRE II  ← ce sera renuméroté par Typst, ne pas s'en soucier
// ============================================================
= Réaction des acides avec les métaux

#atelier[
  *Cette partie est volontairement vide : c'est vous qui allez la
  construire avec l'IA pendant l'atelier.* Suivez les trois gestes
  ci-dessous, puis remplacez ce bloc par le résultat.

  *Geste 1 — Générer la trace écrite.* Donnez à Gemini la structure
  suivante et demandez-lui d'en faire un support de révision pour la 3#super[e]
  (programme officiel, sans notion hors-programme) :

  + *Mise en situation* — des objets métalliques attaqués par un acide.
  + *L'expérience* — limaille de fer + acide chlorhydrique dilué : le
    métal disparaît peu à peu, un gaz se dégage.
  + *Le test du gaz* — on recueille le gaz, on approche une flamme : la
    « détonation » identifie le *dihydrogène* H#sub[2].
  + *L'analyse de la solution* — test à la soude : un précipité vert
    révèle l'apparition d'ions fer Fe#super[2+].
  + *Le bilan* — réactifs : fer + ions H#super[+] ; produits :
    dihydrogène + ions Fe#super[2+] (équation-bilan qualitative).

  *Geste 2 — Générer le schéma de l'expérience* (voir le prompt en
  commentaire juste en dessous), puis l'insérer avec `#schema(...)`.

  *Geste 3 — Relire et corriger* ce que l'IA a produit : c'est vous le
  ou la prof, l'IA propose, vous validez.
]

// ─────────────────────────────────────────────────────────────
//  PROMPT SCHÉMA EXPÉRIENCE (à coller dans Gemini / Nano Banana)
//  Variante « bulles de savon enflammées »
//
//  A flat 2D vector scientific illustration of a chemistry experiment
//  on a white background, showing the reaction between an acid and a
//  metal producing hydrogen gas trapped in soap bubbles and ignited.
//  On the left, a transparent Erlenmeyer flask on a lab bench line,
//  containing grey metal powder at the bottom and a colorless liquid,
//  labeled "Mélange acide + métal (dégagement de H₂)", with small gas
//  bubbles rising. A rubber stopper with a single glass tube leads
//  right into a shallow dish of clear liquid with foam, labeled "Eau +
//  liquide vaisselle". Where the tube enters, a pile of round soap
//  bubbles forms, labeled "Bulles de savon remplies de H₂". On the
//  right, a hand holds a lit wooden splint with a small flame, labeled
//  "Allumette enflammée"; the nearest bubbles have small stylized
//  flames, labeled "Bulles de H₂ enflammées". Clean lines, soft colors,
//  professional diagram style. Labels in French.
// ─────────────────────────────────────────────────────────────

#schema(
  image("experience_acide_metal.png", width: 100%),
  [Schéma — Réaction acide + métal : le dihydrogène piégé dans les bulles de savon s'enflamme],
)

#atelier[
  Une fois votre image générée et téléversée dans le projet, remplacez
  le nom `experience_acide_metal.png` ci-dessus par celui de *votre*
  fichier. Si le schéma ne s'affiche pas : vérifiez qu'il est bien
  téléversé (panneau de gauche sur typst.app) et que le nom est
  identique, *à la lettre près*.
]

// ============================================================
// CHAPITRE III
// ============================================================
= Réaction acide–base : la neutralisation

Que se passe-t-il quand on mélange une solution *acide* et une solution
*basique* ? Les ions responsables de l'acidité et de la basicité se
rencontrent… et se neutralisent.

#def[
  *Réaction acide–base (neutralisation)* — transformation au cours de
  laquelle les ions H#super[+] de l'acide et les ions HO#super[−] de la
  base se combinent pour former de l'*eau*. Le pH du mélange se
  rapproche de *7*.
]

#keyhint[
  L'idée à garder en tête : *H#super[+] + HO#super[−] → eau*. À mesure
  qu'on ajoute la base à l'acide, les ions H#super[+] disparaissent, le
  pH monte et s'approche de 7. Au-delà, si on ajoute trop de base, le
  mélange devient basique à son tour.
]

== Suivre la transformation

En versant peu à peu une solution basique (par exemple de la soude)
dans une solution acide, et en mesurant le pH, on observe :

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  stroke: 0.5pt + c-gray-light,
  inset: 7pt,
  head[Au début][À la fin],
  [Solution *acide*, pH bas, beaucoup de H#super[+]],
  [Solution *proche de neutre*, pH ≈ 7, l'eau s'est formée],
)

#ex[
  Quand on a une remontée acide (« brûlures d'estomac »), on prend
  parfois un médicament basique : il *neutralise* l'excès d'acide de
  l'estomac. C'est exactement une réaction acide–base.
]

// ============================================================
// CHAPITRE IV
// ============================================================
= Identifier les ions : les tests caractéristiques

Comment savoir quels ions sont présents dans une solution, alors qu'ils
sont invisibles ? On utilise des *réactifs* qui provoquent l'apparition
d'un *précipité* d'une couleur caractéristique.

#def[
  *Précipité* — solide coloré qui se forme dans une solution quand on y
  ajoute un réactif. Sa *couleur* permet d'identifier l'ion présent.
]

== Le tableau des tests

#table(
  columns: (1.3fr, 1.3fr, 1.2fr),
  align: (left, left, left),
  stroke: 0.5pt + c-gray-light,
  inset: 6pt,
  head[Ion recherché][Réactif utilisé][Résultat],
  cat-cell[Ion chlorure Cl#super[−]], [Nitrate d'argent], [Précipité *blanc* qui noircit à la lumière],
  cat-cell[Ion cuivre Cu#super[2+]], [Soude], [Précipité *bleu*],
  cat-cell[Ion fer II Fe#super[2+]], [Soude], [Précipité *vert*],
  cat-cell[Ion fer III Fe#super[3+]], [Soude], [Précipité *rouille*],
  cat-cell[Ion zinc Zn#super[2+]], [Soude], [Précipité *blanc*],
)

#key[
  La logique de toute la séquence : une transformation chimique fait
  *disparaître des réactifs* et *apparaître des produits*. Les tests
  d'ions permettent de *vérifier* quels produits se sont formés —
  c'est l'enquête du chimiste.
]

== Glossaire

#table(
  columns: (auto, 1fr),
  align: left,
  stroke: 0.5pt + c-gray-light,
  inset: 6pt,
  head[Terme][Définition],
  cat-cell[Acide], [Solution de pH inférieur à 7, riche en ions H#super[+].],
  cat-cell[Base], [Solution de pH supérieur à 7, riche en ions HO#super[−].],
  cat-cell[Dihydrogène], [Gaz (H#sub[2]) qui « détone » au contact d'une flamme.],
  cat-cell[Indicateur coloré], [Substance qui change de couleur selon le pH.],
  cat-cell[Ion], [Atome ou groupe d'atomes ayant gagné ou perdu un ou plusieurs électrons.],
  cat-cell[Neutralisation], [Réaction entre un acide et une base formant de l'eau.],
  cat-cell[Précipité], [Solide coloré formé lors d'un test d'identification d'ion.],
  cat-cell[Réactif], [Espèce chimique consommée au cours d'une transformation.],
)

== Auto-test : 6 questions pour réviser

#qcm-q(1, [Une solution de pH = 3 est :], options: (
  [Acide], [Neutre], [Basique],
))

#qcm-q(2, [Quel gaz se dégage lors de la réaction entre un acide et un métal comme le fer ?], options: (
  [Le dioxygène], [Le dihydrogène], [Le dioxyde de carbone],
))

#qcm-q(3, [Comment identifie-t-on ce gaz ?], lines: 1)

#qcm-q(4, [Lors d'une neutralisation, les ions H#super[+] et HO#super[−] se combinent pour former :], options: (
  [Un précipité], [De l'eau], [Un métal],
))

#qcm-q(5, [Quel réactif permet de détecter l'ion chlorure Cl#super[−] ?], options: (
  [La soude], [Le nitrate d'argent], [Le bleu de bromothymol],
))

#qcm-q(6, [Avec de la soude, l'ion fer II donne un précipité de couleur…], lines: 1)

#v(10pt)
#block(
  fill: rgb("#fff3bf"),
  stroke: (paint: c-amber, thickness: 1.5pt, dash: "dashed"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-orange, font: "DejaVu Sans")[Réponses :] \

  *Q1.* Acide (pH < 7). \
  *Q2.* Le dihydrogène. \
  *Q3.* On approche une flamme : il « détone » (petit aboiement). \
  *Q4.* De l'eau. \
  *Q5.* Le nitrate d'argent (précipité blanc). \
  *Q6.* Vert.
]
