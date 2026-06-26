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

## 2. Convertir la trace écrite en code Typst (avec Gemini)

Plutôt que de réécrire votre texte avec les balises Typst à la main,
laissez Gemini faire le travail.

1. **Retournez dans votre session Gemini** — celle où vous avez fait
   rédiger la trace écrite à l'[étape 1](02-trace-ecrite.md).
   Pas besoin d'ouvrir une nouvelle conversation : Gemini a votre
   texte en contexte, il va le réutiliser tout seul.
2. **Copiez le prompt ci-dessous** et envoyez-le tel quel à Gemini.
   Il a été calibré pour qu'il génère du Typst qui *compile du premier
   coup* avec le modèle `coquille-st-jacques` :

    ```text title="prompts/conversion-typst.txt"
    --8<-- "prompts/conversion-typst.txt"
    ```

3. Gemini vous renvoie un **bloc de code Typst** — c'est le corps de
   votre chapitre, prêt à coller. S'il s'arrête en plein milieu, tapez
   « continue ».

!!! tip "Pourquoi un prompt aussi long ?"
    Si on demande juste « convertis-moi en Typst », Gemini invente ses
    propres encarts (`#info[]`, `#callout[]`, `#mybox[]`…) et le code ne
    compile pas. Le prompt liste explicitement les helpers du modèle et
    **interdit** d'en créer d'autres. C'est le blindage qui fait que
    ça marche.

## 3. Coller le code dans `main.typ`

Dans votre projet typst.app, ouvrez `main.typ` et trouvez le chapitre
**« Réaction des acides avec les métaux »** avec son encart turquoise
**« À construire en atelier »**.

**Remplacez tout le chapitre** (depuis le `= Réaction des acides…`
jusqu'à la fin du `#atelier[…]`) par le code que Gemini vient de vous
fournir.

L'aperçu PDF, à droite, se met à jour tout seul. Vous voyez
immédiatement les encarts colorés, les définitions, les exemples…

!!! tip "Petit balisage à connaître quand même"
    Au cas où vous voudriez ajuster à la main avant d'imprimer :

    | Vous écrivez… | Vous obtenez… |
    |---------------|---------------|
    | `= Titre` | un grand titre de chapitre (nouvelle page) |
    | `== Sous-titre` | une sous-partie |
    | `*gras*` · `_italique_` | du **gras** · de l'*italique* |
    | `#def[…]` | un encart bleu « Définition » |
    | `#key[…]` | un encart « À retenir » |
    | `#warn[…]` | un encart rouge « Attention » |

    L'**[aide-mémoire imprimable](kit/aide-memoire.pdf)** récapitule
    tout ([source](06-kit.md#source-aide-memoire)).

## 4. Brancher vos images

Le code généré par Gemini contient des **placeholders** d'images
(`schema-01.png`, etc.) avec, dans la légende, une description du
schéma attendu.

1. Téléversez vos deux images dans le projet typst.app (panneau de
   gauche). Si vous n'avez pas encore fait l'[étape 2 (Schémas &
   couverture)](03-images.md), c'est le moment.
2. **Renommez vos images** dans typst.app pour qu'elles correspondent
   exactement aux placeholders, **ou** modifiez les noms dans
   `main.typ` (lignes `image("…")` dans `#schema(...)` et
   `cover-background: image("…")`).
3. Retirez la mention « À GÉNÉRER » dans la légende de chaque
   `#schema` une fois l'image effectivement en place.

L'aperçu PDF se met à jour à chaque téléversement.

## 5. Exporter le PDF

Bouton de téléchargement en haut à droite → votre PDF est prêt. 🎉

## Quand ça coince : les erreurs classiques

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

??? failure "Mes formules chimiques s'affichent bizarrement (`Fe = F·e`, etc.)"
    En mode math (`$ … $`), Typst interprète un identifiant de 2+ lettres
    comme un **produit de variables** : `$Fe^(2+)$` devient `F · e`
    exposant `2+`. Pour les **noms d'atomes**, **ions** ou **molécules**,
    mettez-les entre guillemets :

    | Au lieu de…           | …écrivez                |
    |-----------------------|--------------------------|
    | `$Fe^(2+)$`           | `$"Fe"^(2+)$`            |
    | `$H_2O$`              | `$"H"_2"O"$`             |
    | `$NaCl$`              | `$"NaCl"$`               |
    | `$Fe + 2HCl -> ...$`  | `$"Fe" + 2"HCl" -> …$`   |

    Les **variables d'une seule lettre** (`$x$`, `$n$`, `$V$`, `$pH$`)
    n'ont pas besoin de guillemets.

??? failure "Le sommaire n'affiche qu'une partie"
    Vos chapitres doivent commencer par **un seul** `=`. Les `==` (sous-parties)
    n'apparaissent pas dans le sommaire, c'est voulu.

!!! note "Pour aller plus loin"
    Le **[tutoriel complet](kit/tutoriel.pdf)** détaille tout, pas à pas. À garder
    sous le coude pour vos prochains cours
    ([source](06-kit.md#source-tutoriel) consultable inline).
