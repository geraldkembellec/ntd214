# NTD 214 — Synthèse du cours HTML5 du 20 oct. 2026
## Principes fondamentaux, balises HTML, consignes de réalisation et calendrier

Cette synthèse reprend les notions présentées pendant la séance du 20 octobre 2026. Elle distingue les principes de structuration documentaire, les principales balises HTML abordées, les exigences du travail à réaliser et les échéances évoquées pendant le cours.

L’objectif général est de comprendre comment concevoir une page Web structurée, accessible et exploitable par les navigateurs, les moteurs d’indexation et les outils de traitement de l’information. Le travail s’inscrit dans la continuité de l’étude de cas sur une plateforme de musique en ligne, menée avec M. Obadia dans le cadre de l’UE NTD 214.

## 1. Les principes fondamentaux du HTML5
### 1.1. Comprendre la fonction du HTML

HTML signifie **HyperText Markup Language**. C’est un langage de balisage qui permet de structurer un document destiné à être interprété par un navigateur Web.

Le HTML repose sur trois principes essentiels :

    - La structuration du contenu : les balises permettent de distinguer les titres, les paragraphes, les sections, les listes, les liens et les images.
    - La qualification documentaire : les balises donnent une signification aux éléments du document et permettent d’en identifier la nature.
    - L’hypertextualité : les liens permettent de relier les ressources entre elles et d’organiser la navigation dans un ensemble documentaire.

Le cours insiste sur une distinction fondamentale : le HTML sert à structurer et à qualifier le contenu, tandis que le CSS permet de définir sa présentation visuelle.

Par exemple, la balise ```<em> ``` exprime une emphase. Le navigateur peut la restituer en italique, mais cette présentation peut être modifiée par une feuille de style.

L’enjeu est donc de privilégier la signification des éléments plutôt que leur seule apparence visuelle.

### 1.2. Distinguer HTML, CSS et contenu

Une page Web articule plusieurs composants complémentaires.

| Composant | Fonction | Exemple |
| --- | --- | --- |
| HTML5 | Structure et qualification du contenu | Titres, paragraphes, liens, images |
| CSS	| Présentation visuelle et mise en page	| Couleurs, typographie, espacements |
| Contenus |	Informations présentées au lecteur	| Textes, descriptions, notices documentaires |
| Métadonnées |	Informations décrivant le document |	Titre de la page, encodage des caractères

Le cours introduit également les principes du _responsive design_ : une page doit pouvoir s’adapter à différents supports, notamment les écrans d’ordinateur et les téléphones.

Cette adaptation mobilise les feuilles de style et la structure du document.

### 1.3. Comprendre la logique des balises

Une balise HTML est généralement délimitée par des chevrons.

Exemple :

```HTML
<p>Voici un paragraphe de texte.</p>
```

Dans cet exemple :

* ```<p>``` ouvre le paragraphe ;
* le texte constitue le contenu ;
* ```</p>``` ferme le paragraphe.

La plupart des éléments HTML possèdent une balise ouvrante et une balise fermante. Certaines balises, comme ```<img>``` et ```<meta>```, n’ont pas de balise fermante en HTML5.

Les balises peuvent également comporter des attributs, qui précisent les propriétés d’un élément.

_Exemple :_

```HTML
<html lang="fr">
```

L’attribut ```lang``` indique la langue principale du document.

Les noms de balises et les attributs doivent respecter la syntaxe du langage. Il ne s’agit pas de termes que l’on peut inventer librement.

### 1.4. Séparer structure documentaire et présentation visuelle

La structuration documentaire constitue un point central de la séance.

Un document HTML doit permettre d’identifier la hiérarchie des informations, même lorsque l’on ne tient pas compte de sa présentation graphique.

Par exemple, un titre principal doit être encodé comme un titre de premier niveau, et non simplement agrandi à l’aide du CSS.

Cette distinction présente plusieurs avantages :

* faciliter la compréhension du document par les navigateurs ;
* améliorer son exploitation par les moteurs d’indexation ;
* favoriser l’accessibilité, notamment avec les technologies d’assistance ;
* rendre le document plus facilement maintenable et réutilisable.

## 2. Les principales balises HTML à connaître

Les balises ci-dessous constituent une fiche de révision organisée par fonction. Elles reprennent les éléments présentés pendant la séance et les consignes de réalisation du site.

### 2.1. Structure générale d’une page HTML5

Une page HTML5 doit comporter une structure générale cohérente.

```HTML
<!DOCTYPE html>	Déclare le type de document HTML5.
<html lang="fr">	Délimite le document et indique sa langue.
<head>	Contient les métadonnées du document.
<meta charset="UTF-8">	Définit l’encodage des caractères.
<title>	Définit le titre du document, notamment affiché dans l’onglet du navigateur.
<body>	Contient le contenu principal présenté à l’utilisateur.
```

Exemple de structure minimale :

```HTML
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Musique en ligne</title>
</head>
<body>
    <h1>Musique en ligne</h1>
    <p>Découvrez les artistes, les labels et les albums.</p>
</body>
</html>
```

À retenir : le ```<head>``` contient des informations descriptives et techniques ; 
le ```<body>``` contient les éléments qui constituent le contenu de la page. 
Le titre défini dans ```<title>``` est distinct du titre principal affiché dans la page.

### 2.2. Les titres et les sections

Les titres servent à hiérarchiser l’information, les sections et le conteneur principal à l'encadrer. 


| Balise | Fonction |
| --- | --- |
| ```<h1>``` | Titre principal de la page | 
| ```<h2>``` | Titre d’une section principale | 
| ```<h3>``` | Titre d’une sous-section | 
| ```<h4>``` | 	Titre de niveau inférieur | 
| ```<h5>``` |  Titre de niveau inférieur | 
| ```<h6>``` | 	Sixième niveau de titre | 
| ```<main>``` | Contenu principal, ça se distingue des éléments de confort visuel ou de la publicité contextuelle | 
| ```<section>``` | Regroupe un ensemble de contenu thématiquement cohérent, nécessite un titre de niveau inférieur | 

Le cours présente les six niveaux de titres comme un moyen de représenter la hiérarchie d’un document.

Exemple :


```HTML
<h1>Musique en ligne</h1>
<main>
<section>
    <h2>Les artistes</h2>
    <p>Présentation des artistes référencés.</p>
    <section>
        <h3>Artistes internationaux</h3>
        <p>Présentation des artistes de cette catégorie.</p>
    </section>
</section>
<section>
    <h2>Les labels</h2>
    <p>Présentation des maisons de production.</p>
</section>
<main>
```

La balise ```<section>``` permet de regrouper des contenus qui forment un ensemble cohérent. 
Elle ne produit pas, à elle seule, un effet visuel particulier.

Principe à respecter : la hiérarchie des titres doit correspondre à l’organisation intellectuelle du contenu. Il ne faut pas choisir un niveau de titre uniquement pour obtenir une taille de police particulière.

### 2.3. Les paragraphes et la qualification du texte

Balise	Fonction
```HTML
<p>	Définit un paragraphe.
<strong>	Signale une importance particulière.
<em>	Marque une emphase.
<mark>	Met en évidence un passage pertinent dans le contexte considéré.
<abbr>	Identifie une abréviation.
<code>	Identifie un fragment de code informatique.
```

Exemple :
```HTML
<p>
    Le <strong>HTML5</strong> permet de structurer
    les documents du Web.
</p>
<p>
    Il est <em>essentiel</em> de respecter la structure documentaire.
</p>
<p>
    Cette formation est proposée au
    <abbr title="Conservatoire national des arts et métiers">
        Cnam
    </abbr>.
</p>
```

La distinction entre ```<strong>``` et ```<em>``` est importante : ces balises qualifient le contenu, elles ne servent pas simplement à obtenir du gras ou de l’italique.

Le cours insiste sur le fait que les balises doivent être utilisées à bon escient, en fonction de la signification du texte.

### 2.4. Les liens hypertextes

La balise ```<a>``` permet de créer un lien vers une autre ressource.

Son attribut ```href``` indique la destination du lien.

Exemple :

```HTML
<p>
    Consultez la
    <a href="https://fr.wikipedia.org/">
        Wikipédia
    </a>.
</p>
```

Dans le cadre du projet, les liens doivent permettre de naviguer entre les différentes parties du site et de consulter des ressources externes pertinentes.

Vous pouvez notamment :

* relier un artiste à sa page officielle ;
* relier un album à la page de l’artiste correspondant ;
* relier un artiste au label auquel il est associé ;
* proposer une navigation interne vers une section de la page.

Pour créer une navigation interne, on peut utiliser l’attribut ```id``` sur une section et l’attribut ```href``` sur le lien correspondant.

Exemple :

```HTML
<nav>
    <a href="#artistes">Artistes</a>
    <a href="#labels">Labels</a>
    <a href="#albums">Albums</a>
</nav>
<section id="artistes">
    <h2>Les artistes</h2>
</section>
<section id="labels">
    <h2>Les labels</h2>
</section>
<section id="albums">
    <h2>Les albums</h2>
</section>
```

Cette organisation répond directement à la consigne de proposer une barre de navigation et des sections correspondant aux catégories documentaires du site. 

### 2.5. Les images et leur description documentaire

Le cours demande d’intégrer au minimum une image libre de droits par article, avec un texte alternatif, un titre et une légende.

Les principaux éléments à connaître sont les suivants :

Élément	Fonction

```HTML
<img>	Insère une image.
src	Indique l’emplacement de l’image.
alt	Fournit un texte alternatif à l’image.
title	Peut fournir une information complémentaire associée à l’élément.
<figure>	Regroupe un contenu autonome, par exemple une image et sa légende.
<figcaption>	Fournit la légende du contenu placé dans <figure>.
```

Exemple :
```HTML
<figure>
    <img
        src="images/artiste-exemple.jpg"
        alt="Portrait de l'artiste"
        title="Portrait de l'artiste"
    >
    <figcaption>
        Portrait de l'artiste, source et crédit photographique.
    </figcaption>
</figure>
```

Le texte alternatif doit décrire l’information pertinente portée par l’image. Il contribue notamment à l’accessibilité du document.

Point de vigilance : une image visible dans la page ne suffit pas à satisfaire la consigne documentaire. Il faut également renseigner son texte alternatif, sa légende et les informations nécessaires à l’identification de sa source.

### 2.6. Les listes

Les listes permettent d’organiser des informations de manière structurée.
```HTML
Balise	Fonction
<ul>	Crée une liste non ordonnée.
<ol>	Crée une liste ordonnée avec son attribut optionnel type 
<li>	Définit un élément de liste.
```

Exemple :

```HTML
<h2>Les genres musicaux</h2>
<ul>
    <li>Rock</li>
    <li>Jazz</li>
    <li>Musique électronique</li>
</ul>
```

Pour une liste dont l’ordre est significatif, on utilise plutôt ```<ol>```.

Les listes facilitent la lecture et permettent de présenter les informations selon une structure explicite.

### 2.7. Les balises de navigation et les éléments sémantiques

La balise ```<nav>``` sert à regrouper des liens de navigation.

Exemple :

```HTML
<nav>
    <ul>
        <li><a href="#artistes">Artistes</a></li>
        <li><a href="#labels">Labels</a></li>
        <li><a href="#albums">Albums</a></li>
    </ul>
</nav>
```

Elle donne une signification fonctionnelle au groupe de liens : il s’agit d’un dispositif de navigation.

Dans la conception d’un site documentaire, cette qualification aide à distinguer les différentes composantes de la page.


## 3. Les métadonnées, l’encodage et la qualité documentaire

### 3.1. Les métadonnées HTML

Les métadonnées décrivent le document et apportent des informations utiles à son traitement.

Elles sont notamment placées dans la section <head>.

La séance insiste sur la nécessité de distinguer ce qui est visible dans le navigateur des informations qui sont interprétées par les outils logiciels.

Le titre du document, la langue et l’encodage des caractères font partie des éléments importants de cette description.

### 3.2. L’encodage des caractères

L’encodage détermine la manière dont les caractères sont représentés dans le document.

La déclaration suivante doit être présente dans l’en-tête :

```HTML
<meta charset="UTF-8">
```
Elle permet notamment de gérer correctement les caractères accentués et les caractères spéciaux utilisés dans les contenus en français.

Un encodage cohérent est indispensable pour éviter les problèmes d’affichage du texte.

### 3.3. La validation du code HTML

Le cours demande de produire un document aussi conforme que possible aux spécifications du HTML5 et de vérifier sa validité à l’aide du validateur du W3C.

Le validateur permet notamment de détecter :

* des erreurs de syntaxe ;
* des balises incorrectement utilisées ;
* des attributs non conformes ;
* des problèmes de structure du document.

L’objectif est de produire une page correctement interprétable par les navigateurs.

La validation doit être considérée comme une étape du travail, et non comme une vérification facultative réalisée uniquement à la fin.

### 3.4. Les règles de nommage et le plan de classement

Le projet ne porte pas uniquement sur l’écriture du HTML. Il comprend également une dimension d’organisation documentaire.

Deux notions doivent être maîtrisées :

Les règles de nommage définissent la manière de nommer les fichiers de façon cohérente.

Exemples :

* index.html ;
* style.css ;
* artiste-exemple.jpg.

Le plan de classement organise les répertoires et les fichiers selon une architecture logique.

Exemple d’arborescence :
```text
| musique-online/
├── index.html
├── style.css
└── images/
    ├── artiste-exemple.jpg
    ├── album-exemple.jpg
    └── label-exemple.jpg
```
Cette organisation facilite la maintenance, la compréhension et la transmission du projet.

Le cours demande explicitement que les règles de nommage et l’arborescence soient cohérentes.

## 4. Le travail à réaliser : le projet « Musique Online »

### 4.1. Le contexte du projet

Le projet prolonge l’étude de cas commencée avec M. Obadia autour d’une plateforme de musique en ligne.

Le travail de modélisation du système d’information documentaire est poursuivi par la réalisation de sa couche de présentation Web.

L’objectif est de transformer les besoins identifiés et les informations modélisées en une interface HTML5 permettant de consulter les ressources documentaires.

Les éléments présentés peuvent notamment être des artistes, des labels et des albums. Les catégories doivent correspondre à une organisation documentaire explicite. 

### 4.2. Les exigences fonctionnelles du site

Le site doit respecter les consignes suivantes.

Exigence	Travail attendu
Contenus	Présenter au minimum 10 éléments documentaires.
Typologie	Organiser les éléments par catégories : artistes, labels, albums, etc.
Structure	Prévoir un titre principal et des titres secondaires.
Navigation	Ajouter une barre de navigation vers les différentes sections.
Liens	Créer des liens internes et externes pertinents.
Images	Intégrer au minimum une image libre de droits par article.
Accessibilité	Ajouter un texte alternatif aux images.
Légendes	Prévoir une légende et un titre pour les images.
Encodage	Déclarer correctement l’encodage des caractères.
Conformité	Tester le document avec le validateur HTML du W3C.

Ces exigences correspondent aux consignes formulées pendant la séance.  

### 4.3. Les choix de conception

Le site peut être réalisé de deux manières.

Option A : une page unique

Toutes les catégories sont présentées sur une même page. Une barre de navigation permet de se déplacer vers les différentes sections.

Option B : plusieurs pages

Les contenus sont répartis sur plusieurs pages, reliées entre elles par des liens hypertextes.

Dans les deux cas, la structure doit rester cohérente avec la typologie des ressources.

Par exemple, une section consacrée aux artistes doit regrouper les notices d’artistes, tandis qu’une section consacrée aux albums doit présenter les albums.

Les liens doivent également refléter les relations entre les ressources : un album peut renvoyer vers son artiste et son label.

Le choix entre une page unique et plusieurs pages est laissé à votre appréciation, à condition de respecter les exigences fonctionnelles du cahier des charges. 

### 4.4. Les livrables attendus

Le cours prévoit deux livrables principaux, auxquels s’ajoute une possibilité facultative de publication en ligne.

Livrable 1 — Le site Web au format HTML5

Il s’agit du site réalisé et fourni sous la forme d’une archive ZIP.

Cette archive doit comprendre :

* le ou les fichiers HTML ;
* la feuille de style CSS ;
* les images associées ;
* une arborescence cohérente ;
* des noms de fichiers respectant des règles de nommage explicites.

Le site doit être organisé et suffisamment complet pour que son fonctionnement puisse être vérifié localement.

Livrable 2 — Un document de synthèse d’une page

Un document d’une page doit accompagner le site.

Il doit présenter :

1. Les noms des membres du groupe.
2. La manière dont le travail HTML s’intègre dans l’étude de cas conduite avec M. Obadia.
3. Une reformulation du cahier des charges fonctionnel.
4. Les choix techniques retenus pour réaliser le site.
5. Les balises utilisées et les choix d’encodage.
6. Les éventuelles difficultés rencontrées.
7. Les prompts utilisés pour interroger une IA, le cas échéant, ainsi qu’une appréciation des réponses obtenues.

Ce document doit permettre de comprendre les décisions prises pendant la réalisation du site. Il ne s’agit donc pas uniquement d’une description du résultat visuel.  

Publication en ligne — Option facultative

Le cours évoque également la possibilité de publier la page sur GitHub.

Cette publication constitue un bonus. Elle n’est pas présentée comme une obligation pour le rendu initial.

La séance de régulation suivante doit notamment permettre de revenir sur la mise en ligne du site.

### 4.5. Les modalités de travail

Le travail doit être réalisé en priorité en groupe, selon les équipes constituées avec M. Obadia.

Le cours précise toutefois que les personnes travaillant de manière autonome ou décalée peuvent réaliser le travail individuellement.

La conception doit être envisagée comme un prolongement du travail de modélisation du système d’information documentaire. Les choix réalisés en HTML doivent donc correspondre aux besoins fonctionnels du projet.

Enfin, l’usage de l’intelligence artificielle est possible pour obtenir des explications, comprendre une notion ou s’aider dans la réalisation. Le cours demande cependant de ne pas déléguer intégralement le travail d’apprentissage à l’IA et de documenter son utilisation dans le rapport.

## 5. Les dates et le calendrier de travail

La transcription permet d’identifier les échéances suivantes.

Date ou période	Événement ou travail	Statut
20 octobre 2026	Séance consacrée à la présentation HTML5, à la structuration documentaire et au cahier des charges du site.	Séance réalisée.
1er novembre 2026	Échéance initialement évoquée pour le travail de modélisation avec M. Obadia.	Échéance initiale mentionnée dans l’échange.
Semaine du 26 octobre 2026	Poursuite du travail en autonomie et préparation des livrables.	Période de travail déduite du calendrier.
12 novembre 2026	Date de rendu annoncée pour le travail HTML5.	Échéance annoncée pendant le cours.
Semaine suivant la séance	Régulation consacrée notamment à la mise en ligne sur GitHub.	Séance annoncée ; date exacte non précisée.

Attention concernant les échéances : la transcription mentionne une discussion sur le report éventuel du travail de modélisation de M. Obadia, initialement prévu pour le 1er novembre et susceptible d’être repoussé à la mi-novembre. Le report n’est toutefois pas confirmé explicitement dans l’extrait disponible. Il convient donc de vérifier cette date auprès de l’enseignant concerné.

En revanche, le 12 novembre 2026 est bien la date annoncée pour le rendu du travail HTML5.  

Proposition de rétroplanning

Pour organiser le travail jusqu’au 12 novembre, voici une proposition opérationnelle.

Étape	Travail à effectuer
1. Cadrage	Relire le cahier des charges et confirmer les catégories documentaires retenues.
2. Collecte	Sélectionner les 10 éléments au minimum, réunir les textes, les liens et les images.
3. Architecture	Définir l’arborescence, les noms de fichiers et l’organisation des sections.
4. Réalisation	Écrire le HTML5, ajouter les liens et intégrer les images.
5. Mise en forme	Créer la feuille CSS et vérifier la lisibilité de la page.
6. Contrôle	Vérifier les liens, l’encodage, les textes alternatifs et la validité HTML.
7. Documentation	Rédiger le document de synthèse d’une page et préciser les éventuels usages de l’IA.
8. Livraison	Constituer l’archive ZIP et vérifier que tous les fichiers nécessaires sont présents.

Ce rétroplanning est une proposition d’organisation du travail, et non un calendrier imposé dans la transcription.

⸻

## 6. La checklist finale avant le rendu

Avant de remettre votre travail, vérifiez les points suivants.

Structure HTML

* Le document est déclaré en HTML5.
* La langue du document est renseignée.
* L’encodage UTF-8 est déclaré.
* Le titre de la page est défini.
* Le contenu est placé dans <body>.
* Les titres respectent une hiérarchie logique.

Contenu et navigation

* Le site présente au moins 10 éléments documentaires.
* Les éléments sont organisés par catégories.
* Une barre de navigation est présente.
* Les liens internes et externes fonctionnent.
* Les relations entre artistes, albums et labels sont représentées lorsque cela est pertinent.

Images et accessibilité

* Les images sont libres de droits.
* Chaque article comporte au minimum une image.
* Les images possèdent un texte alternatif pertinent.
* Les titres et les légendes sont renseignés.

Organisation technique

* Le HTML et le CSS sont enregistrés dans des fichiers distincts.
* Les noms de fichiers sont cohérents.
* L’arborescence est compréhensible.
* Le site fonctionne localement.
* Le code a été vérifié avec un validateur HTML.

Livraison

* Le site est fourni dans une archive ZIP.
* Le document de synthèse d’une page est joint.
* Les choix techniques sont expliqués.
* Les éventuels prompts d’IA et leur évaluation sont documentés.
* La publication sur GitHub, si elle est réalisée, est considérée comme un bonus.

## 7. Les cinq notions à retenir en priorité

Pour réviser efficacement cette séance, cinq principes doivent être maîtrisés.

1. Le HTML structure le contenu. Les balises définissent la nature des éléments d’une page et leur organisation.

2. La structure documentaire donne du sens au document. Les titres, les sections, les paragraphes et les listes permettent d’identifier la hiérarchie des informations.

3. La présentation visuelle est distincte de la structure. Le HTML porte la structure ; le CSS porte les règles de présentation.

4. Une page Web est aussi une ressource documentaire. Les métadonnées, les liens, les textes alternatifs, les légendes et l’organisation des fichiers contribuent à sa qualité et à son exploitabilité.

5. Le rendu attendu doit être documenté et vérifiable. Le site HTML5 et le document de synthèse constituent les deux livrables principaux annoncés, avec un rendu prévu le 12 novembre 2026.

Le fil directeur de la séance est donc la conception d’une interface Web dont la structure technique traduit correctement l’organisation documentaire et les besoins fonctionnels du système d’information.
