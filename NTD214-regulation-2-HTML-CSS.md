# NTD 214 — Synthèse de la régulation 2 : HTML5, CSS et publication Web
## Principes fondamentaux, sélecteurs CSS, _responsive design_, _GitHub Pages_ et travail à réaliser

La séance porte sur la mise en forme avec CSS, les différentes méthodes de sélection des éléments, l’adaptation aux supports d’affichage et une première publication en ligne avec _GitHub Pages_.

## 1. Les principes fondamentaux du CSS
### 1.1. Comprendre la fonction du CSS

CSS signifie **_Cascading Style Sheets_**, ou feuilles de style en cascade. Le CSS décrit la présentation visuelle d’un document : couleurs, typographie, dimensions, espacements et mise en page.

Le principe central est de pouvoir conserver une même structure HTML et lui appliquer différentes présentations. Le cours évoque notamment le projet [CSS Zen Garden](https://csszengarden.com/), qui illustre la possibilité de transformer l’apparence d’une même page sans en changer la structure documentaire.

| Composant | Fonction | Exemples |
| --- | --- | --- |
| HTML | Structure et qualification du contenu | Titres, sections, paragraphes, liens, images |
| CSS | Présentation visuelle | Couleurs, typographie, dimensions, espacements, disposition |
| Contenu | Informations présentées | Textes, notices, images et autres ressources |

Le CSS peut également s’appliquer à des documents XML. Dans le cadre de cette séance, l’essentiel est de comprendre comment relier une feuille de style à une page HTML.

### 1.2. Trois manières d’appliquer des styles

Nous distinguons trois méthodes.

| Méthode | Principe | Appréciation |
| --- | --- | --- |
| Style en ligne | Utiliser l’attribut `style` directement sur une balise HTML | À éviter comme méthode générale : les styles sont dispersés dans le document |
| Feuille de style interne | Placer les règles CSS dans un élément `<style>` de l’en-tête HTML | Possible, mais les styles restent intégrés à la page |
| Feuille de style externe | Écrire les règles dans un fichier `.css` séparé et le relier au HTML | Méthode privilégiée : les styles sont séparés du contenu et peuvent être réutilisés |

Pour relier une feuille de style externe, on utilise dans le `<head>` une balise de la forme :

```html
<link rel="stylesheet" href="style.css">
```

Le chemin indiqué dans `href` doit correspondre à l’emplacement réel du fichier CSS.

La séparation du HTML et du CSS facilite l’organisation du code, sa maintenance et la réutilisation d’une même feuille de style sur plusieurs pages.

### 1.3. Syntaxe d’une règle CSS

Une règle CSS associe un **sélecteur** à un ensemble de déclarations. Chaque déclaration associe une propriété à une valeur.

```css
h1 {
    color: #333333;
    font-size: 2em;
}
```

Dans cet exemple :

- `h1` est le sélecteur : il cible les éléments `<h1>` ;
- `color` et `font-size` sont des propriétés ;
- `#333333` et `2em` sont les valeurs ;
- les déclarations sont placées entre accolades ;
- chaque déclaration se termine habituellement par un point-virgule.

Une erreur de syntaxe, comme l’oubli d’un point-virgule ou d’une accolade, peut empêcher une règle de s’appliquer correctement. L’indentation et le retour à la ligne ne sont pas indispensables à l’interprétation du CSS, mais ils rendent la feuille de style plus lisible.

## 2. Les sélecteurs CSS

Les sélecteurs déterminent les éléments HTML auxquels une règle CSS s’applique. La séance présente trois modes de sélection principaux : 
- par type de balise ;
- par identifiant ;
- et par classe.

### 2.1. Sélectionner les balises par leur nom

Le nom d’une balise permet d’appliquer le même style à tous les éléments de ce type.

```css
header {
    background-color: #e8e0d0;
}
```

Cette règle cible tous les éléments `<header>` du document. Le même principe peut s’appliquer à `footer`, `p`, `h1`, `article`, `img` ou à d’autres balises.

Cette méthode est utile lorsqu’on souhaite harmoniser globalement la présentation de tous les éléments d’un même type.

### 2.2. Sélectionner un élément par son identifiant

L’attribut HTML `id` permet de donner un identifiant à un élément. En CSS, le sélecteur correspondant commence par le caractère `#`.

HTML :

```html
<section id="section-1">
    <h2>Titre de la section</h2>
    <p>Contenu de la section.</p>
</section>
```

CSS :

```css
#section-1 {
    background-color: #fffdf8;
    padding: 20px;
}
```

L’identifiant doit être unique dans le document HTML. Il convient donc de l’utiliser pour désigner un élément particulier, et non comme mécanisme général pour appliquer un style identique à de nombreux éléments.

Un identifiant peut également servir de destination à un lien de navigation interne, par exemple `<a href="#section-1">`.

### 2.3. Sélectionner des éléments par une classe

Une classe permet d’appliquer un même style à plusieurs éléments, y compris à des balises différentes. En CSS, le sélecteur de classe commence par un point.

HTML :

```html
<header class="zone-encadree">
    <h1>Titre principal</h1>
</header>
<section class="section">
    <h2>Titre de section</h2>
    <p>Contenu.</p>
</section>
<footer class="zone-encadree">
    Informations complémentaires
</footer>
```

CSS :

```css
.zone-encadree {
    background-color: #e8e0d0;
    padding: 20px;
}
.section {
    background-color: #fffdf8;
    padding: 20px;
}
```

La classe `zone-encadree` peut être appliquée à l’en-tête et au pied de page. La classe `section` peut être appliquée à plusieurs sections pour leur donner une présentation commune.

### 2.4. Comparer `id` et `class`

| Critère | Identifiant `id` | Classe `class` |
| --- | --- | --- |
| Sélecteur CSS | `#nom` | `.nom` |
| Usage principal | Cibler un élément unique | Cibler un ou plusieurs éléments |
| Réutilisation dans la page | L’identifiant doit être unique | La classe peut être partagée |
| Exemple | `#section-1` | `.section` |

Les identifiants et les classes peuvent coexister sur un même élément. Par exemple, une section peut avoir `id="section-1"` pour permettre la navigation interne et `class="section"` pour recevoir un style commun aux autres sections.

Le cours recommande de privilégier les balises sémantiques HTML lorsqu’elles sont adaptées au contenu. Une balise générique telle que `<div>` peut être utile pour regrouper des éléments, mais elle ne donne pas à elle seule de signification documentaire particulière.

### 2.5. Couleurs et valeurs CSS

Les couleurs peuvent être indiquées par leur nom lorsqu’il existe un nom CSS correspondant, ou par une notation numérique telle que le code hexadécimal.

```css
header {
    background-color: #e8e0d0;
    color: #333333;
}
```

Un code hexadécimal commence par `#`. Les outils de sélection de couleurs et les palettes peuvent aider à choisir des couleurs complémentaires et à conserver une identité visuelle cohérente.

Le choix des couleurs relève de la conception visuelle, mais doit conserver une bonne lisibilité, notamment un contraste suffisant entre le texte et son arrière-plan.

## 3. Adapter la présentation aux supports

### 3.1. _Responsive design_ et _Media Queries_

Le _responsive design_ consiste à adapter la présentation d’une page aux caractéristiques du support et à la taille de l’écran. La séance précise que cette adaptation se réalise avec le CSS, notamment grâce aux **_Media Queries_**.

Une _Media Query_ permet d’appliquer certaines règles lorsque des conditions sont réunies, par exemple lorsque la largeur de l’écran est inférieure à une valeur donnée.

```css
@media screen and (max-width: 600px) {
    article {
        width: 100%;
    }
}
```

Cet exemple applique une largeur de 100 % aux éléments `<article>` lorsque la fenêtre d’affichage à l’écran ne dépasse pas 600 pixels de large.

Les valeurs de largeur et les règles doivent être choisies en fonction du contenu et de la présentation souhaitée. Il ne s’agit pas d’appliquer mécaniquement une valeur unique à tous les projets.

### 3.2. Types de médias

Le cours présente plusieurs types de médias que les feuilles de style peuvent cibler.

| Type | Usage évoqué |
| --- | --- |
| `all` | Tous les médias compatibles |
| `screen` | Écrans : ordinateurs, tablettes et téléphones |
| `print` | Impression et rendu destiné à l’impression, notamment en PDF |
| `speech` | Restitution vocale par des outils compatibles |

Une règle de mise en forme peut donc être adaptée à l’écran ou à l’impression. Par exemple, certains éléments de navigation ou éléments secondaires peuvent être masqués dans la version destinée à l’impression afin de privilégier le contenu principal.

La séance évoque également la possibilité de proposer des présentations adaptées à certains besoins de lecture, par exemple un fort contraste. La structure documentaire du HTML reste importante pour que le contenu puisse être interprété par les technologies d’assistance.

### 3.3. Accessibilité et structure documentaire

La feuille de style peut modifier la présentation, mais elle ne remplace pas une structuration HTML cohérente. Les titres, les sections, les liens et les autres éléments sémantiques contribuent à l’identification des différentes parties du document.

La séance fait référence au RGAA, le Référentiel général d’amélioration de l’accessibilité, dans le contexte des sites soumis à des exigences d’accessibilité. Elle rappelle l’intérêt de tester les pages et de penser à la lisibilité pour différents publics.

## 4. Organiser les fichiers du projet

### 4.1. Séparer les ressources

La séance reprend les principes d’organisation documentaire déjà abordés : les fichiers doivent être rangés dans une arborescence cohérente et porter des noms explicites.

Une organisation possible est :

```text
musique-online/
├── index.html
├── style.css
├── pages/
│   ├── artistes.html
│   ├── albums.html
│   └── labels.html
└── images/
    ├── artiste-exemple.jpg
    ├── album-exemple.jpg
    └── label-exemple.jpg
```

Cette arborescence est un exemple d’organisation, et non une structure imposée. Elle distingue les pages HTML, la feuille de style et les images. Les chemins inscrits dans les attributs `href` et `src` doivent être cohérents avec cette organisation.

### 4.2. Règles de nommage

Le cours rappelle l’intérêt de règles de nommage homogènes, par exemple le *kebab-case* : des mots en minuscules séparés par des tirets, sans espaces ni accents.

Exemples :

- `index.html`
- `style.css`
- `artiste-exemple.jpg`

Une organisation régulière réduit les erreurs de chemin, facilite la maintenance et rend le projet plus compréhensible lorsqu’il est transmis ou publié.

### 4.3. Le fichier d’accueil

Le nom `index.html` est présenté comme le nom usuel du fichier d’accueil d’un site statique. Il doit se trouver à l’emplacement attendu par la configuration de publication utilisée.

## 5. Publier une page avec GitHub Pages

### 5.1. À quoi sert GitHub ?

La séance présente GitHub comme une plateforme permettant (notamment) de conserver et partager des fichiers, de travailler de manière collaborative et de publier des pages Web statiques avec GitHub Pages.

La publication en ligne est présentée comme une possibilité complémentaire et un bonus pour le projet, pas comme une obligation du rendu initial.

### 5.2. Principe général de publication

La démonstration suit le principe général suivant :

1. Créer ou ouvrir un dépôt GitHub destiné au projet.
2. Ajouter les fichiers nécessaires, notamment la page HTML et la feuille de style CSS.
3. Vérifier que le fichier d’accueil porte le nom `index.html`.
4. Enregistrer les modifications dans le dépôt, notamment avec un *commit*.
5. Ouvrir les paramètres du dépôt et accéder à la rubrique **Pages**.
6. Configurer la publication à partir d’une branche et de l’emplacement approprié.
7. Attendre la publication, puis ouvrir l’adresse fournie pour vérifier le résultat.
8. Contrôler que la page HTML charge bien la feuille de style et les images.

Les noms exacts des menus peuvent évoluer dans l’interface GitHub. L’objectif pédagogique est de comprendre le lien entre les fichiers du dépôt et la page Web publiée.

### 5.3. Vérifications après publication

Une page qui fonctionne localement peut présenter des problèmes une fois publiée si les chemins des ressources sont incorrects ou si les fichiers nécessaires n’ont pas été ajoutés au dépôt.

Après publication, il faut vérifier :

- que la page d’accueil est accessible ;
- que la feuille CSS est correctement chargée ;
- que les images s’affichent ;
- que les liens internes et externes fonctionnent ;
- que les noms de fichiers et les chemins respectent exactement la casse et l’arborescence du dépôt.

La séance mentionne également l’usage d’outils de validation pour examiner le HTML et les feuilles de style. La validation ne remplace pas un test visuel et fonctionnel du site.

## 6. Clarifications apportées pendant la régulation

La séance précise que le travail HTML demandé est plutôt individuel. La régulation constitue un temps complémentaire consacré à la suite du cours, aux questions, aux outils et aux difficultés rencontrées.

Le projet reste lié à l’étude de cas « Musique Online » conduite avec M. Obadia : le travail de modélisation documentaire est prolongé par la conception de l’interface destinée à l’utilisateur. La séance se concentre sur la présentation ; le stockage en base de données et l’étude des CMS sont annoncés pour une étape ultérieure.

## 7. Le travail à réaliser et le calendrier

### Projet « Musique Online »

Le travail demandé prolonge l’étude de cas sur la plateforme musicale. Il s’agit de concevoir une interface HTML5 permettant à l’utilisateur de consulter des éléments documentaires classés par type, par exemple des artistes, des albums et des labels.

Les exigences rappelées pendant la séance sont celles du cahier des charges présenté dans la synthèse précédente :
- présenter au minimum dix éléments documentaires ;
- organiser les éléments par catégories ;
- construire une structure de page cohérente ;
- prévoir une navigation adaptée ;
- ajouter des liens pertinents ;
- intégrer des images et documenter ces ressources ;
- utiliser une feuille de style CSS ;
- vérifier le code et le fonctionnement du site.

Le choix entre une page unique organisée en sections et plusieurs pages liées entre elles dépend de la conception retenue, sous réserve de respecter les exigences fonctionnelles.

### Livrables

Les deux livrables principaux rappelés dans le cours précédent restent :
1. le site Web HTML5, fourni dans une archive ZIP avec les fichiers nécessaires ;
2. un document de synthèse d’une page présentant notamment le groupe ou l’auteur, l’intégration à l’étude de cas, le cahier des charges, les choix techniques, les difficultés et, le cas échéant, les usages de l’IA.

La publication sur GitHub Pages est une possibilité facultative et un bonus. Elle peut servir à tester et à présenter le résultat en ligne.

### Proposition de rétroplanning

1. **Cadrage** : relire le cahier des charges et préciser les catégories documentaires.
2. **Collecte** : sélectionner les éléments, réunir les textes, les liens et les images.
3. **Structure HTML** : organiser les pages, les titres, les sections et la navigation.
4. **Feuille de style** : créer le fichier CSS et choisir les styles communs, les couleurs et les espacements.
5. **Adaptation** : vérifier la lisibilité sur différentes largeurs d’écran ; ajouter des _Media Queries_ si nécessaire.
6. **Contrôle** : vérifier les chemins, les liens, les images, le contraste et la validité du code.
7. **Documentation** : rédiger le document de synthèse d’une page et documenter les usages éventuels de l’IA.
8. **Livraison** : préparer l’archive ZIP et vérifier que les fichiers nécessaires sont présents.
9. **Bonus éventuel** : publier le site avec GitHub Pages et vérifier la version en ligne.

Ce rétroplanning est une proposition d’organisation, et non un calendrier supplémentaire imposé pendant la régulation.

## 8. Checklist avant le rendu

### HTML et organisation documentaire
- Le document HTML5 possède une structure cohérente.
- Les titres correspondent à la hiérarchie des informations.
- Les éléments sont classés selon des catégories explicites.
- Les liens internes conduisent aux bonnes sections ou pages.
- Les balises sémantiques sont choisies en fonction de leur rôle.

### CSS
- Le fichier CSS est séparé du HTML et correctement référencé.
- Les sélecteurs par balise, identifiant ou classe sont utilisés à bon escient.
- Les règles sont syntaxiquement correctes.
- Les couleurs et la typographie préservent la lisibilité.
- La présentation reste utilisable sur différents supports.

### Ressources et qualité
- Les chemins vers les fichiers correspondent à l’arborescence.
- Les images sont accompagnées des informations documentaires nécessaires.
- Les liens fonctionnent.
- Le HTML et le CSS ont été vérifiés avec des outils adaptés.
- Le site a été testé dans un navigateur.

### Livraison
- L’archive ZIP contient les pages HTML, la feuille CSS et les ressources nécessaires.
- Le document de synthèse d’une page est joint.
- Les choix techniques et les éventuelles difficultés sont explicités.
- Les usages éventuels de l’IA sont documentés.
- Si le site est publié sur GitHub Pages, la version en ligne a été vérifiée.

## 9. Les notions à retenir en priorité

1. **HTML et CSS ont des fonctions distinctes** : le HTML structure et qualifie le contenu ; le CSS règle sa présentation visuelle.
2. **Les styles doivent être organisés** : une feuille CSS externe favorise la séparation des responsabilités, la maintenance et la réutilisation.
3. **Les sélecteurs n’ont pas la même portée** : le nom de balise cible un type d’élément, `#identifiant` cible un élément unique et `.classe` permet de partager un style.
4. **Les Media Queries adaptent la présentation** : une feuille de style peut prévoir des règles différentes selon le support ou la largeur de l’écran, notamment pour l’impression et les petits écrans.
5. **La qualité documentaire reste centrale** : une présentation visuelle ne remplace pas une structure HTML cohérente, des liens fonctionnels et une organisation claire des fichiers.
6. **GitHub Pages permet une publication statique** : le dépôt contient les fichiers du site et la configuration Pages permet de les rendre accessibles en ligne. Cette publication est présentée comme un bonus pour le projet.
