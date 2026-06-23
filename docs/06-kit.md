# Le kit & aller plus loin

Tout ce qu'il faut pour refaire la démarche, seul·e, tranquillement, sur **vos**
cours.

## À télécharger

<div class="grid cards" markdown>

-   :material-folder-zip: **Le kit projet Typst**

    Le modèle, l'exemple, les polices et les images de départ.

    [:material-download: projet-typst.zip](kit/projet-typst.zip)

-   :material-book-open-variant: **Le tutoriel complet**

    Le guide pas-à-pas pour Typst, sans connaissance technique.

    [:material-download: tutoriel.pdf](kit/tutoriel.pdf)

-   :material-card-text-outline: **L'aide-mémoire**

    Une page à imprimer avec toute la syntaxe utile.

    [:material-download: aide-memoire.pdf](kit/aide-memoire.pdf)

-   :material-file-pdf-box: **La séquence d'exemple**

    Le résultat complet sur les acides, bases et ions.

    [:material-download: exemple_ions.pdf](kit/exemple_ions.pdf)

</div>

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

## Aller plus loin : maths, équations, figures géométriques

Typst gère nativement la **notation mathématique** (équations, racines,
indices, exposants…) et s'enrichit d'extensions pour les **figures
vectorielles exactes**, comme la bibliothèque
[CETZ](https://cetz-package.github.io/) — pratique pour les triangles,
cercles, courbes, schémas géométriques.

[:material-file-pdf-box: Exemple : le théorème de Pythagore (PDF)](kit/exemple_maths.pdf){ .md-button }

Cet exemple, rédigé pour une classe de 3ᵉ, montre comment combiner :

- des **équations** alignées (calcul d'hypoténuse, vérification de la réciproque) ;
- des **figures vectorielles** dessinées en CETZ (triangle annoté,
  échelle contre un mur) — toujours nettes à l'impression, modifiables
  à la main, sans logiciel de dessin séparé ;
- les encarts du modèle (`#def`, `#key`, `#warn`, `#ex`, `#keyhint`)
  pour structurer la démonstration.

La source de l'exemple est dans le repo :
[`kit-sources/exemple_maths.typ`](https://github.com/dmetzler/un-cours-avec-l-ia/blob/main/kit-sources/exemple_maths.typ)
— vous pouvez la copier dans votre projet typst.app et l'adapter.

## Pour creuser Typst

- Le **tutoriel officiel** : [typst.app/docs/tutorial](https://typst.app/docs/tutorial)
- La **documentation** : [typst.app/docs](https://typst.app/docs)

---

!!! success "Bravo"
    Vous savez maintenant fabriquer un support de cours illustré avec l'IA, de la
    page blanche au PDF. Le reste, c'est de la pratique.
