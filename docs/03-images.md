# Étape 2 — Schémas & couverture

!!! success "Objectif de l'étape"
    Générer **deux images** avec Gemini : le **schéma de l'expérience** et une
    **couverture** un peu marrante pour la séquence.

Gemini sait aussi **fabriquer des images** (la fonctionnalité s'appelle *Nano
Banana*). Même outil, même conversation : on lui décrit l'image, il la dessine.

!!! warning "Si la génération d'images est indisponible"
    Sur certains comptes, la génération d'images peut être bridée. Dans ce cas,
    prévenez l'animateur : on basculera sur une solution de secours. Le reste de
    la méthode ne change pas.

## A. Le schéma de l'expérience

On veut le montage **acide + métal**, avec le dihydrogène piégé dans des **bulles
de savon** qui s'enflamment. Copiez ce prompt dans Gemini :

```text
A flat 2D vector scientific illustration of a chemistry experiment on a white
background, showing the reaction between an acid and a metal producing hydrogen
gas trapped in soap bubbles and ignited.
On the left, a transparent Erlenmeyer flask on a lab bench line, containing grey
metal powder at the bottom and a colorless liquid, labeled "Mélange acide + métal
(dégagement de H₂)", with small gas bubbles rising. A rubber stopper with a single
glass tube leads right into a shallow dish of clear liquid with foam, labeled
"Eau + liquide vaisselle". Where the tube enters, a pile of round soap bubbles
forms, labeled "Bulles de savon remplies de H₂". On the right, a hand holds a lit
wooden splint with a small flame, labeled "Allumette enflammée"; the nearest
bubbles have small stylized flames, labeled "Bulles de H₂ enflammées".
Clean lines, soft colors, professional diagram style. All labels in French.
```

!!! tip "Pour ajuster"
    - Légendes en français qui débordent ou fautives ? Demandez : « Refais l'image
      avec les légendes exactes : … ».
    - Trop chargé ? « Simplifie, garde 4 légendes maximum. »
    - Téléchargez l'image qui vous convient (clic droit → enregistrer), vous en
      aurez besoin à l'étape 3.

## B. La couverture (format portrait 3:4)

Deux façons de faire. La maligne : **demander d'abord à l'IA d'écrire le prompt**,
à partir de votre cours.

=== "1. Faire écrire le prompt"

    Dans la conversation où vous avez votre cours, demandez :

    ```text
    À partir de ce cours sur les acides, les bases et les ions, propose-moi un
    prompt en anglais pour générer une image de COUVERTURE.
    Contraintes : format portrait 3:4, style illustration scientifique 3D ludique
    et colorée, fond clair, AUCUN TEXTE sur l'image. Rends-le amusant.
    ```

=== "2. Ou partir de cet exemple"

    ```text
    A playful 3D scientific illustration, portrait 3:4, light background.
    A heroic little "ion" character — a blue sphere marked with a big "+" sign
    (cation) wearing a light cape — teams up with a red sphere marked with a "−"
    sign (anion), inside a giant beaker filled with translucent turquoise liquid.
    Around them: rising hydrogen bubbles, a colorful pH paper strip unrolled like
    a banner (red to purple), and a small friendly flame at the top.
    Soft lighting from upper-left, vivid colors, cinematic depth. NO TEXT.
    ```

Collez le prompt obtenu dans Gemini, générez, et **téléchargez** la couverture.

!!! note "Cohérence graphique"
    Pour que toute la séquence ait le même style, réutilisez les mêmes mots-clés
    de style (« flat 2D vector », « soft colors »…) d'un schéma à l'autre.

## ✅ Avant de passer à la suite

Vous devez avoir **deux fichiers image** téléchargés sur le Chromebook : le
**schéma d'expérience** et la **couverture**. Direction l'assemblage.
