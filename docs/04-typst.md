# Étape 3 — Assembler dans Typst

!!! success "Objectif de l'étape"
    Réunir votre texte et vos deux images dans le modèle, et **exporter un PDF**
    propre, prêt à imprimer.

**Typst** est un outil de mise en page : on écrit le contenu dans un fichier
texte, il fabrique un beau PDF. Tout le style (couleurs, encarts, couverture) est
déjà fait dans le modèle — vous n'avez qu'à **remplir**.

## 1. Démarrer un projet depuis Typst Universe

C'est la méthode **la plus simple** : un clic, et vous avez un projet
pré-rempli prêt à éditer.

1. Allez sur **[typst.app](https://typst.app)** et créez un compte gratuit
   (connexion avec Google possible).
2. Dans la barre latérale ou via **[typst.app/universe](https://typst.app/universe)**,
   ouvrez **Typst Universe** et tapez **« coquille »** dans la recherche.
3. Sélectionnez **[coquille-st-jacques](https://typst.app/universe/package/coquille-st-jacques)** —
   la fiche du modèle s'ouvre, avec un aperçu de la page de couverture.
4. Sur la fiche du package, cliquez sur le bouton qui crée un projet
   (libellé proche de **« Create project in app »** ou **« Try in app »**
   selon la version de l'interface) :
   typst.app crée un nouveau projet pré-rempli avec un `main.typ`, une
   couverture et un schéma d'exemple.
5. Vous pouvez commencer à éditer immédiatement.

!!! tip "À quoi ressemble le projet de départ"
    Le modèle vous donne un `main.typ` qui démontre les fonctionnalités
    principales : couverture, encarts (`#def`, `#key`, `#warn`, `#ex`,
    `#analogy`, `#keyhint`), schéma légendé, questions QCM. Vous
    remplacez le contenu et les deux images, et vous avez votre cours.

??? note "Méthode alternative : à partir du kit téléchargeable"
    Si vous voulez démarrer **à partir de la séquence d'exemple** de
    l'atelier (acides, bases et ions) plutôt que du modèle vierge, ou si
    vous voulez l'avoir en local hors-ligne :

    1. Téléchargez le **[kit projet](kit/projet-typst.zip)**, décompressez-le.
    2. Sur typst.app : **+ Empty project**, puis glissez-déposez tout le
       contenu du dossier (`main.typ`, le dossier `fonts`, et les images).

    Le `main.typ` du kit utilise `#import "@preview/coquille-st-jacques:0.1.0": *` —
    typst.app télécharge le modèle automatiquement depuis Universe au
    premier compile.

!!! note "Pourquoi le dossier `fonts` (méthode kit) ?"
    Il garantit que votre PDF aura **exactement** le même rendu que
    l'exemple, quel que soit l'ordinateur. Ne le supprimez pas.

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
    Il manque la première ligne
    `#import "@preview/coquille-st-jacques:0.1.0": *` en haut de `main.typ`.

??? failure "« package not found » au premier rendu"
    Vérifiez la ligne d'import à l'identique :
    `#import "@preview/coquille-st-jacques:0.1.0": *`. typst.app télécharge
    le modèle automatiquement depuis Universe la première fois — il faut
    juste une connexion internet (quasi-instantané ensuite, c'est mis en
    cache).

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
