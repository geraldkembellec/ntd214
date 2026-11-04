# NTD214 · Séance 3

# Bases de données relationnelles et PHP

### De la donnée stockée à la page web dynamique

**Support de cours — 3 novembre 2026**  
*Master MéDAS · Systèmes d'information documentaire*


---


## Sommaire

1. [Positionnement et architecture](#1-positionnement-de-la-séance-dans-le-module)
2. [Structure d’une base relationnelle](#2-comprendre-la-structure-dune-base-relationnelle)
3. [Environnement local MAMP](#3-environnement-local--installer-et-utiliser-mamp)
4. [Créer une base et une table](#4-créer-une-base-et-une-table-avec-phpmyadmin)
5. [PHP : produire une page dynamique](#5-php--produire-une-page-dynamique)
6. [Relier PHP à la base avec MySQLi](#6-relier-php-à-la-base-de-données-avec-mysqli)
7. [Intégrer les résultats dans une page](#7-intégrer-les-résultats-dans-une-page-structurée)
8. [CSV et importation](#8-du-tableur-à-la-base--csv-et-importation)
9. [Travail demandé](#9-travail-demandé--prolonger-le-projet-de-site-musical)
10. [Vocabulaire essentiel](#10-vocabulaire-essentiel)
11. [Points de vigilance](#11-points-de-vigilance-techniques)
12. [Checklist](#12-checklist-de-réalisation)
13. [Repères de syntaxe](#13-repères-de-syntaxe)
14. [Précautions complémentaires](#14-précautions-pour-aller-au-delà-de-la-démonstration)
15. [Synthèse générale](#15-synthèse-générale)

---

## Objectifs pédagogiques

À l’issue de la séance, vous devez pouvoir :

- distinguer une base, une table, un champ et un enregistrement ;
- expliquer le rôle d’une clé primaire et choisir des types adaptés ;
- créer une base et une table avec phpMyAdmin ;
- importer des données depuis un fichier CSV ;
- tester des requêtes SQL simples ;
- expliquer la différence entre PHP, HTML et CSS ;
- décrire la chaîne **connexion → requête → résultat → affichage** ;
- intégrer un résultat issu d’une base dans une page PHP ;
- exporter une base au format SQL.

## Schéma général du fonctionnement

``` text
NAVIGATEUR
    | requête HTTP
    v
SERVEUR WEB (Apache)
    |
    v
SCRIPT PHP
    | requête SQL
    v
SGBD (MySQL / MariaDB)
    | résultat
    v
SCRIPT PHP
    | génération HTML
    v
SERVEUR WEB
    | réponse HTTP
    v
NAVIGATEUR : affichage HTML + CSS
```

> **À retenir —** le navigateur ne dialogue pas directement avec la base.
Le code PHP est exécuté côté serveur ; le navigateur reçoit le résultat
produit.

## 1. Positionnement de la séance dans le module

Les séances précédentes ont abordé deux niveaux du système d'information
:

- la modélisation du système et de ses données (modèle conceptuel de
    données, puis modèle logique) ;
- la couche de présentation : structure HTML et rendu d'une page pour
    le projet de site musical.

La séance introduit la couche intermédiaire : le programme qui récupère
les données dans une base et les transmet à la page affichée dans le
navigateur.

L'objectif est de comprendre comment les différentes couches d'un
système d'information s'articulent, puis de réaliser un premier
chargement de données et leur affichage.

### 1.1. Le principe général : données, traitement, présentation

Le cours mobilise le modèle **MVC (Model–View–Controller)** comme
grille de lecture simplifiée. L'exercice ne met pas en œuvre une
architecture MVC complète : il en reprend le principe général de
séparation des données, du traitement et de la présentation.

| Composant | Fonction dans le dispositif | Technologies |
|---|---|---|
| **Modèle** (*Model*) | Organiser et stocker les données | Base relationnelle, MySQL/MariaDB |
| **Contrôleur** (*Controller*) | Interroger la base, sélectionner les données utiles et préparer leur transmission | PHP et SQL |
| **Vue** (*View*) | Présenter les informations dans une page | HTML et CSS |

Le schéma fonctionnel est le suivant :

1. Le navigateur demande une page au serveur web.
2. Le serveur exécute le script PHP.
3. Le script PHP communique avec le système de gestion de base de
    données (SGBD).
4. La base exécute la requête SQL et renvoie un résultat.
5. PHP parcourt ce résultat et construit le contenu HTML.
6. Le serveur renvoie la page produite au navigateur, qui l'affiche.

> **À retenir —** les informations affichées ne sont pas
nécessairement écrites directement dans le fichier HTML. Elles peuvent
être stockées dans une base et injectées dans la page au moment de la
requête par un script (PHP par exemple).


---


## 2. Comprendre la structure d'une base relationnelle

### 2.1. Tables, lignes, colonnes et attributs

Une base relationnelle est organisée en tables. Dans l'exemple de la
séance, une table `eleve` contient les informations suivantes :

| id | prenom | nom | ville | metier |
|---:|---|---|---|---|
| 1 | Xavier | Aimé | Nantes | Enseignant-chercheur |
| 2 | Claire | Scopsi | Paris | Enseignant-chercheur |
| … | … | … | … | … |

Le vocabulaire utilisé pendant le cours :

- **table** : ensemble structuré d'enregistrements portant sur un même
    type d'objet ;
- **ligne / occurrence / tuple** : enregistrement correspondant à une
    occurrence ;
- **colonne / champ / attribut** : propriété décrivant les occurrences
    ;
- **valeur** : contenu d'une cellule.

Petit retour sur la modélisation :

- Le modèle conceptuel décrit les entités et les associations ;
- le modèle logique traduit cette organisation dans une structure
    relationnelle ;
- le modèle physique précise la manière dont les tables, les champs,
    les types et les contraintes sont effectivement créés dans un SGBD.

### 2.2. Pourquoi une clé primaire ?

Le nom et le prénom ne suffisent pas à identifier sûrement une personne
: plusieurs individus peuvent être homonymes. La base doit donc disposer
d'un identifiant stable et unique.

Une **clé primaire** (*primary key*) est un attribut --- ou un ensemble
d'attributs --- qui identifie sans ambiguïté chaque ligne d'une table.

Dans l'exercice, le champ `id` joue ce rôle. Le SGBD peut générer
automatiquement sa valeur grâce à l'option `AUTO_INCREMENT`.

Il est possible d'utiliser un identifiant préexistant dans certains
contextes. Dans l'exercice, on retient un identifiant artificiel généré
par la base. Un identifiant technique dédié évite notamment de
réutiliser une donnée personnelle comme identifiant.

### 2.3. Types de données et longueur des champs

Lors de la création d'une table, chaque champ doit recevoir un type
adapté à la nature des informations stockées.

Les types suivants sont évoqués pendant la séance. Ils ne sont pas interchangeables : chacun correspond à une famille de valeurs :

- nombres entiers : `TINYINT`, `SMALLINT`, `INT`, `MEDIUMINT`,
    `BIGINT` ;
- chaînes de caractères de longueur variable : `VARCHAR(n)` ;
- dates : `DATE`.

Le tableau suivant propose une structure illustrative, reprise de l'exercice :

| Champ | Type envisagé | Justification |
|---|---|---|
| `id` | Entier, auto-incrémenté | Identifiant numérique généré par le SGBD |
| `prenom` | `VARCHAR(32)` | Chaîne de caractères |
| `nom` | `VARCHAR(32)` | Chaîne de caractères |
| `ville` | `VARCHAR(32)` | Chaîne de caractères |
| `metier` | `VARCHAR(32)` | Chaîne de caractères |

La longueur d'un `VARCHAR` doit être réfléchie : une taille trop courte
peut empêcher l'enregistrement de certaines valeurs ; une taille
inutilement importante traduit souvent une conception insuffisamment
réfléchie. Le stockage réel dépend du moteur et du type utilisé.

Le choix d'un type entier dépend également de l'ordre de grandeur
attendu. Il n'est pas nécessaire de réserver un type permettant des
milliards de valeurs si la table ne contiendra que quelques dizaines ou
centaines d'enregistrements.

### 2.4. Valeurs obligatoires et valeurs facultatives

La conception doit préciser si un champ peut rester vide (`NULL`) ou
s'il doit obligatoirement être renseigné.

Dans l'exemple, l'identifiant est nécessairement présent et généré par
le SGBD. Le caractère obligatoire des autres champs dépend de la réalité
documentaire décrite : un métier, par exemple, peut être inconnu ou non
renseigné.

Il faut distinguer :

- l'existence d'une valeur ;
- l'unicité d'une valeur ;
- l'indexation d'un champ ;
- le rôle de clé primaire.

Ces propriétés ne sont pas interchangeables.


---


## 3. Environnement local : installer et utiliser MAMP

### 3.1. Pourquoi travailler en local ?

Pour les exercices, le serveur web fonctionne directement sur
l'ordinateur de chaque étudiant. Il n'est donc pas nécessaire de louer
un hébergement distant.

Le cours présente **MAMP**, disponible pour macOS et Windows, comme
environnement local réunissant les composants nécessaires à l'exécution
d'un site dynamique : serveur web, PHP et serveur de base de données.

Le cours situe également cet ensemble dans la famille des environnements
de type **LAMP** :

- Linux ;
- Apache ;
- MySQL (ou un système compatible, tel que MariaDB) ;
- PHP.

MAMP fournit une solution équivalente adaptée à l'environnement de
travail local.

### 3.2. Répertoire `htdocs`

Les fichiers du site doivent être placés dans le répertoire servi par le
serveur web, généralement nommé `htdocs`.

Les chemins peuvent varier selon le système et la version de MAMP.

Exemples :

- macOS : répertoire `htdocs` situé dans l'installation de MAMP ;
- Windows : répertoire `C:\MAMP\htdocs`.

Créer un sous-répertoire par projet permet de séparer les fichiers des
différents exercices.

### 3.3. Accéder au serveur local

Deux notions sont introduites :

- **adresse IP** : adresse numérique permettant d'identifier une
    interface sur un réseau ;
- **nom d'hôte** : nom permettant d'accéder à une machine ou à un
    service.

Pour désigner la machine locale, le cours utilise :

- `127.0.0.1` : adresse de boucle locale IPv4 ;
- `localhost` : nom d'hôte usuellement associé à cette adresse.

Un site placé dans `htdocs/ntd214` est ainsi accessible depuis le
navigateur avec une adresse locale de la forme
`http://localhost/ntd214/`.

Le serveur recherche généralement un fichier d'accueil tel que
`index.html` ou `index.php` lorsque l'on appelle un répertoire.

### 3.4. phpMyAdmin

**phpMyAdmin** est une interface web d'administration de bases
MySQL/MariaDB. Elle permet notamment de :

- créer une base de données ;
- créer et modifier des tables ;
- définir les champs et leurs types ;
- insérer ou modifier des enregistrements ;
- exécuter des requêtes SQL ;
- exporter une base.

L'interface sert à construire et à vérifier la base. Dans l'application
finale, le script PHP interrogera directement le SGBD.


---


## 4. Créer une base et une table avec phpMyAdmin

### 4.1. Créer la base

L'exemple construit une base dédiée à la promotion NTD214. Le cours
insiste sur le choix de l'encodage des caractères : **UTF-8**, avec la
variante `utf8mb4` mentionnée dans l'interface.

L'encodage doit être cohérent entre la base, les tables et l'application
afin de prendre correctement en charge les caractères accentués et les
écritures internationales.

### 4.2. Créer la table `eleve`

La table comporte cinq champs :

1. `id` ;
2. `prenom` ;
3. `nom` ;
4. `ville` ;
5. `metier`.

Pour `id`, on choisit un type entier, on active l'auto-incrémentation et
on définit le champ comme clé primaire.

Pour les champs textuels, on choisit `VARCHAR` avec une longueur
adaptée.

### 4.3. Insérer des données

La séance montre deux façons d'ajouter des enregistrements :

- utiliser le formulaire d'insertion de phpMyAdmin ;
- écrire directement une instruction SQL.

Exemple de principe présenté :

``` sql
INSERT INTO eleve (prenom, nom, ville, metier)
VALUES ('Xavier', 'Aimé', 'Nantes', 'Enseignant-chercheur');
```

Lorsque l'identifiant est auto-incrémenté, il n'est pas nécessaire de le
fournir dans l'insertion.

### 4.4. Interroger les données avec SQL

SQL (*Structured Query Language*) est le langage utilisé pour interroger
et manipuler les bases relationnelles.

La séance introduit notamment :

``` sql
SELECT * FROM eleve;
```

Cette requête demande toutes les colonnes de toutes les lignes de la
table `eleve`.

Pour ne récupérer qu'un champ :

``` sql
SELECT prenom FROM eleve;
```

Pour filtrer les résultats :

``` sql
SELECT * FROM eleve
WHERE metier = 'Enseignant';
```

Le filtre `WHERE` permet de sélectionner les enregistrements qui
répondent à une condition.

Le cours montre également la différence entre une recherche exacte et
l'utilisation de `LIKE`. Le comportement de comparaison entre majuscules
et minuscules dépend de la collation choisie pour la base ou le champ.
Dans l'exemple, la collation insensible à la casse permet de retrouver
une valeur malgré une différence de capitalisation.

> **À retenir —** il est utile de tester une requête dans phpMyAdmin avant
de l'intégrer au script PHP. On vérifie ainsi séparément la logique SQL
et le code qui affichera le résultat.


---


## 5. PHP : produire une page dynamique

### 5.1. PHP et HTML : deux rôles différents

Le HTML décrit la structure du document et les éléments à présenter. PHP
est un langage exécuté côté serveur ; il peut effectuer des traitements,
communiquer avec une base et produire du HTML.

Un fichier contenant du PHP porte l'extension `.php`. Le code PHP est
délimité par :

``` php
<?php
// Instructions PHP
?>
```

Le serveur exécute le code PHP avant de renvoyer la réponse au
navigateur. Le navigateur reçoit donc le résultat HTML, et non le code
PHP à exécuter.

Un fichier `index.php` peut contenir du HTML, du PHP, ou un mélange des
deux.

### 5.2. Afficher une chaîne de caractères

La fonction `print` permet d'afficher une valeur :

``` php
<?php
print("Hello");
?>
```

Une chaîne de caractères peut être délimitée par des guillemets simples
ou doubles.

### 5.3. Variables et concaténation

Une variable PHP commence par le signe `$`. Elle permet de stocker une
valeur réutilisable.

``` php
<?php
$nom = "Aude";
print("Hello " . $nom);
?>
```

L'opérateur `.` réalise une **concaténation** : il assemble des chaînes
de caractères et des valeurs converties en chaînes.

### 5.4. Tableaux associatifs

La séance construit un tableau contenant plusieurs personnes, chacune
décrite par un prénom et un nom.

Exemple simplifié :

``` php
<?php
$tableau = [
    ["prenom" => "Aude", "nom" => "Grégoire"],
    ["prenom" => "Sarah", "nom" => "Guillemain"]
];
?>
```

Un tableau permet de regrouper plusieurs valeurs. Chaque ligne est
elle-même un tableau associatif : les clés `prenom` et `nom` permettent
d'accéder aux valeurs.

### 5.5. Parcourir un tableau avec `foreach`

La boucle `foreach` permet de traiter successivement chaque élément d'un
tableau :

``` php
<?php
foreach ($tableau as $ligne) {
    print($ligne["prenom"]);
}
?>
```

À chaque itération, `$ligne` contient l'élément courant du tableau. On
peut donc afficher une propriété particulière, ici le prénom.

### 5.6. Mélanger PHP et HTML

Un script PHP peut produire des éléments HTML. On peut notamment
construire une liste à partir des données :

``` php
<ul>
<?php
foreach ($tableau as $ligne) {
    print("<li>" . $ligne["prenom"] . "</li>");
}
?>
</ul>
```

La structure HTML peut être écrite directement hors des balises PHP. À
l'intérieur du PHP, les éléments HTML doivent être produits par une
instruction d'affichage ou une autre méthode de génération.

On peut (ré)utiliser notamment : - `<ul>` pour une liste non ordonnée
; - `<li>` pour chaque élément de liste ; - `<br>` pour un saut de ligne
; - `<pre>` pour afficher du texte préformaté lors d'un premier test de
visualisation.

Le but est de passer progressivement d'un affichage de test à une
intégration dans une page HTML structurée.


---


## 6. Relier PHP à la base de données avec MySQLi

### 6.1. Le connecteur

Pour interroger la base depuis PHP, le cours utilise l'extension
**MySQLi**. Elle permet d'établir une connexion avec un serveur MySQL ou
MariaDB.

La connexion nécessite plusieurs paramètres :

- le nom d'hôte du serveur ;
- le nom d'utilisateur ;
- le mot de passe ;
- le nom de la base de données.

Dans l'environnement local de démonstration, le serveur est désigné par
`localhost` et le compte utilisé est `root`. Les paramètres exacts ---
notamment le mot de passe --- dépendent de l'installation de MAMP. Ces
identifiants ne doivent pas être repris tels quels sur un serveur de
production.

Exemple de structure :

``` php
<?php
$connecteur = new mysqli(
    "localhost",
    "root",
    "mot_de_passe",
    "nom_de_la_base"
);
?>
```

La variable `$connecteur` représente le lien entre le script PHP et le
SGBD.

### 6.2. Envoyer une requête SQL

Une fois la connexion établie, PHP peut transmettre une requête au SGBD
avec la méthode `query()`.

``` php
<?php
$requete = "SELECT * FROM eleve";
$resultat = $connecteur->query($requete);
?>
```

Le SGBD exécute la requête et renvoie un résultat que PHP peut
parcourir.

### 6.3. Parcourir le résultat et afficher les champs

Le principe démontré consiste à parcourir les lignes renvoyées et à
afficher les valeurs utiles dans la page.

Exemple de mise en œuvre pédagogique :

``` php
<?php
$requete = "SELECT * FROM eleve";
$resultat = $connecteur->query($requete);

while ($ligne = $resultat->fetch_assoc()) {
    print("<p>");
    print($ligne["prenom"] . " " . $ligne["nom"]);
    print("</p>");
}
?>
```

Le point important n'est pas de mémoriser chaque instruction, mais de
comprendre la chaîne de traitement :

**connexion → requête SQL → résultat → parcours des lignes → génération
HTML.**

### 6.4. Filtrer les données à la source

Le cours montre ensuite qu'il est possible de modifier la requête pour
n'afficher qu'une catégorie de personnes.

``` php
<?php
$requete = "SELECT * FROM eleve WHERE metier = 'Enseignant'";
$resultat = $connecteur->query($requete);
?>
```

Le filtrage est effectué dans la base de données. PHP ne reçoit alors
que les enregistrements répondant à la condition.

Cette logique est essentielle pour un site documentaire : la page peut
afficher les artistes d'un genre musical, les titres d'un album, les
œuvres d'un artiste ou les labels associés à une catégorie.


---


## 7. Intégrer les résultats dans une page structurée

La démonstration reprend le gabarit HTML et la feuille de style utilisés
lors des séances précédentes. Le code PHP est intégré dans cette
structure afin de conserver une présentation cohérente.

Les éléments évoqués dans le gabarit sont notamment :

- `<header>` : en-tête ;
- `<nav>` : navigation ;
- `<main>` : contenu principal ;
- `<section>` : section de contenu ;
- `<footer>` : pied de page ;
- `<h1>`, `<h2>` : titres ;
- `<ul>` et `<li>` : listes.

La feuille CSS est appelée depuis la page PHP comme dans une page HTML
classique.

### 7.1. Exemple documentaire : les contributeurs

Dans la démonstration, la liste des contributeurs est affichée dans le
pied de page. Les noms sont issus de la base de données et non écrits en
dur dans le HTML.

La page devient ainsi un document dont une partie du contenu est
produite dynamiquement.

### 7.2. Exemple de filtre : afficher les enseignants

Une seconde page ou un lien permet d'afficher uniquement les personnes
dont le métier correspond à « Enseignant ».

Cette démonstration met en évidence trois opérations distinctes :

1. sélectionner les données pertinentes dans la base avec SQL ;
2. parcourir le résultat avec PHP ;
3. présenter les données dans une liste HTML.

Le cours présente cette réalisation comme un **mini-CMS** : les contenus
sont stockés dans une base et injectés dans une page par un programme.
Un système de gestion de contenu plus complet, tel que WordPress, repose
sur une logique générale comparable, avec beaucoup plus de
fonctionnalités.


---


## 8. Du tableur à la base : CSV et importation

La séance commence par un tableur Google Sheets partagé pour recueillir
des données d'exemple (identifiant, prénom, ville, métier). Il est
explicitement précisé que le tableur n'est pas lui-même la base de
données : il sert de support de collecte avant transformation.

Le cours annonce la conversion du classeur au format **CSV**
(*Comma-Separated Values*), format textuel permettant de représenter des
données tabulaires.

À retenir : - une ligne du CSV correspond généralement à un
enregistrement ; - les valeurs d'une ligne sont séparées par un
délimiteur ; - la première ligne peut contenir les noms des colonnes ; -
il faut vérifier le séparateur et l'encodage lors de l'importation.

### Procédure d'importation montrée en séance

1. Sélectionner la table cible dans phpMyAdmin.
2. Ouvrir l'onglet **Importer** et choisir le fichier CSV.
3. Vérifier l'encodage (UTF-8) et le format CSV.
4. Indiquer le séparateur effectivement utilisé dans le fichier
    (virgule dans la démonstration).
5. Demander à phpMyAdmin d'ignorer la première ligne lorsqu'elle
    contient les en-têtes.
6. Lancer l'importation puis vérifier les enregistrements ajoutés.

Après l'import, contrôler le nombre de lignes, la correspondance entre
colonnes et champs, ainsi que le rendu des caractères accentués.


---


## 9. Travail demandé : prolonger le projet de site musical

Le travail demandé consiste à reprendre le projet HTML du site musical
et à y intégrer une petite base de données ainsi qu'un affichage PHP.

### 9.1. Étapes de réalisation

1. **Choisir les données à gérer.**\
    Par exemple : artistes, chanteurs, labels, titres, genres musicaux
    ou autres éléments cohérents avec le projet.

2. **Modéliser une petite base.**\
    Définir une table et ses champs. Prévoir une clé primaire et des
    types adaptés.

3. **Créer la base sur l'environnement local.**\
    Utiliser MAMP et phpMyAdmin pour créer la base et la table.

4. **Insérer quelques enregistrements.**\
    Les données doivent être suffisantes pour tester les affichages et
    les filtres.

5. **Tester les requêtes SQL dans phpMyAdmin.**\
    Vérifier notamment une requête qui récupère un élément et une
    requête qui récupère une liste d'éléments.

6. **Transformer la page HTML en page PHP.**\
    Conserver le gabarit et la feuille de style, puis intégrer le code
    qui récupère les données.

7. **Créer une page dédiée à un élément.**\
    Exemple donné : une page qui affiche un chanteur ou un artiste.

8. **Créer une page de liste.**\
    Exemple donné : une page qui affiche tous les chanteurs, ou tous les
    chanteurs d'un style musical.

9. **Exporter la base au format SQL.**\
    L'export doit contenir la structure de la base et les données, afin
    que l'enseignant puisse la reconstituer sur son propre ordinateur.

### 9.2. Livrables et échéance

La consigne formulée en fin de séance est la suivante :

- une archive **ZIP** contenant les éléments du travail ;
- les fichiers PHP et les ressources nécessaires à leur fonctionnement
    ;
- un export de la base au format **`.sql`** ;
- une capture d'écran de la table créée dans phpMyAdmin.

L'enseignant indique que le travail sera repris et suivi lors de la
séance suivante. Le rendu doit être une archive ZIP. La consigne finale
fixe l'échéance au **27 novembre 2026 à 23 h 59**.

### 9.3. À quoi sert l'export SQL ?

L'export demandé n'est pas un export CSV. Il doit conserver :

- les instructions de création de la base et des tables ;
- la définition des champs et de la clé primaire ;
- les instructions d'insertion des données.

Un fichier `.sql` constitue donc une sauvegarde réutilisable :
l'enseignant pourra l'importer sur son propre environnement pour
vérifier le travail, avec les fichiers PHP associés.


---


## 10. Vocabulaire essentiel

| Terme | Définition |
|---|---|
| **Base de données** | Ensemble organisé de données persistantes. |
| **SGBD** | Logiciel qui gère les bases, les tables et l’exécution des requêtes. |
| **Table** | Structure relationnelle organisée en lignes et colonnes. |
| **Tuple / occurrence** | Enregistrement, généralement représenté par une ligne. |
| **Attribut / champ** | Propriété représentée par une colonne. |
| **Clé primaire** | Champ ou ensemble de champs identifiant chaque ligne de manière unique. |
| `AUTO_INCREMENT` | Mécanisme de génération automatique d’un identifiant numérique. |
| **Type de données** | Nature des valeurs admises dans un champ. |
| `VARCHAR` | Type de chaîne de caractères de longueur variable. |
| **SQL** | Langage de requête et de manipulation des données relationnelles. |
| `SELECT` | Instruction de sélection de données. |
| `WHERE` | Clause de filtrage des enregistrements. |
| `INSERT INTO` | Instruction d’insertion d’un enregistrement. |
| **PHP** | Langage exécuté côté serveur, notamment utilisé pour produire des pages dynamiques. |
| **Variable** | Espace nommé contenant une valeur ; son nom commence par `$` en PHP. |
| **Tableau** | Structure permettant de regrouper plusieurs valeurs. |
| `foreach` | Boucle de parcours des éléments d’un tableau. |
| **Concaténation** | Assemblage de chaînes ou de valeurs ; opérateur `.` en PHP. |
| **MySQLi** | Extension PHP permettant de communiquer avec MySQL/MariaDB. |
| `localhost` | Nom d’hôte désignant la machine locale. |
| **MAMP** | Environnement local permettant d’exécuter un serveur web, PHP et un SGBD. |
| **phpMyAdmin** | Interface web d’administration d’une base MySQL/MariaDB. |
| **CSV** | Format textuel d’échange de données tabulaires. |
| **CMS** | Système de gestion de contenu alimentant des pages à partir de données. |
| **MVC** | Modèle d’organisation distinguant modèle, contrôleur et vue. |


---


## 11. Points de vigilance techniques

Les points suivants explicitent certains éléments de la démonstration
afin d'éviter de reproduire des raccourcis de l'oral.

1. **Identifiant et données personnelles.** Une clé primaire
    artificielle (`id`) est généralement préférable à un identifiant
    personnel tel qu'un numéro de sécurité sociale. Ce dernier ne doit
    pas être réutilisé comme identifiant de convenance.

2. **Mot de passe de connexion.** Les identifiants `root` montrés
    pendant la séance sont ceux d'un environnement de démonstration
    local. Une application déployée doit utiliser un compte dédié, avec
    des droits limités, et ne doit pas exposer ses identifiants dans un
    dépôt public.

3. **Requêtes SQL et saisies externes.** Les exemples de la séance
    utilisent des requêtes simples et des valeurs fixes. Dès qu'une
    valeur provient d'un formulaire ou d'un utilisateur, il faut
    utiliser des requêtes préparées plutôt que concaténer directement
    cette valeur dans une requête SQL.

4. **Gestion des erreurs.** Une application doit vérifier que la
    connexion et la requête ont réussi avant de parcourir le résultat.
    Les exemples de démonstration privilégient la compréhension du
    mécanisme et ne constituent pas un dispositif complet de gestion des
    erreurs.

5. **Affichage HTML.** Les valeurs provenant d'une base doivent être
    échappées avant affichage dans une page HTML, afin d'éviter
    l'injection de code HTML ou JavaScript.

6. **Encodage.** Il faut conserver une cohérence d'encodage, notamment
    en UTF-8, entre les fichiers, la connexion et la base.

7. **Données et présentation.** La base stocke les données ; PHP les
    sélectionne et prépare leur affichage ; HTML structure le document ;
    CSS en définit la présentation. Cette séparation facilite la
    maintenance et la réutilisation des contenus.


---


## 12. Checklist de réalisation

### Environnement

- [ ] MAMP est installé et le serveur est démarré.
- [ ] Le projet est placé dans le répertoire `htdocs`.
- [ ] La page d'accueil est accessible depuis `localhost`.
- [ ] phpMyAdmin est accessible.

### Base de données

- [ ] La base est créée avec un encodage cohérent (UTF-8 / `utf8mb4`).
- [ ] La table comporte les champs nécessaires.
- [ ] Une clé primaire identifie chaque enregistrement.
- [ ] Les types et longueurs sont adaptés.
- [ ] Plusieurs enregistrements ont été insérés.
- [ ] Les requêtes SQL ont été testées dans phpMyAdmin.

### PHP et affichage

- [ ] La page HTML a été transformée en fichier `.php`.
- [ ] Le script établit une connexion à la base.
- [ ] Une requête récupère les données attendues.
- [ ] Le résultat est parcouru en PHP.
- [ ] Une page affiche un élément particulier.
- [ ] Une page affiche une liste ou une sélection filtrée.
- [ ] Le rendu conserve le gabarit HTML et la feuille CSS.
- [ ] Les liens et les pages fonctionnent depuis le serveur local.

### Livrables

- [ ] Les fichiers PHP sont présents.
- [ ] Les ressources nécessaires (CSS, images, etc.) sont incluses.
- [ ] L'export SQL contient structure et données.
- [ ] La capture d'écran de la table est incluse.
- [ ] Tous les éléments sont regroupés dans une archive ZIP.
- [ ] L'archive est déposée avant le 27 novembre 2026 à 23 h 59.


---


## Synthèse intermédiaire : ce qu'il faut avoir compris

À l'issue de cette séance, il faut pouvoir expliquer le fonctionnement
général d'une page web alimentée par une base de données :

- les données sont structurées dans une base relationnelle ;
- une clé primaire permet d'identifier chaque enregistrement ;
- SQL sert à sélectionner et à filtrer les données ;
- PHP établit la connexion au SGBD et exécute les requêtes ;
- le résultat est parcouru par le programme ;
- PHP génère ou complète le HTML ;
- le navigateur affiche la page structurée et mise en forme par CSS.

Le résultat pédagogique recherché est la compréhension de cette
articulation. Le projet musical devient ainsi une première réalisation
de publication dynamique : les contenus sont stockés séparément de leur
présentation et peuvent être réutilisés dans plusieurs pages selon les
requêtes effectuées.

## 13. Repères de syntaxe

### SQL

``` sql
-- Toutes les colonnes et toutes les lignes
SELECT * FROM eleve;

-- Une seule colonne
SELECT prenom FROM eleve;

-- Plusieurs colonnes
SELECT prenom, nom FROM eleve;

-- Filtrer les enregistrements
SELECT * FROM eleve
WHERE metier = 'Enseignant';

-- Recherche textuelle contenant un terme
SELECT * FROM eleve
WHERE metier LIKE '%enseignant%';

-- Insérer un enregistrement
INSERT INTO eleve (prenom, nom, ville, metier)
VALUES ('Xavier', 'Aimé', 'Nantes', 'Enseignant-chercheur');
```

### PHP

``` php
<?php
$nom = "Aude";
print("Bonjour " . $nom);

$tableau = [
    ["prenom" => "Aude", "nom" => "Grégoire"],
    ["prenom" => "Sarah", "nom" => "Guillemain"]
];

foreach ($tableau as $ligne) {
    print($ligne["prenom"] . " " . $ligne["nom"]);
    print("<br>");
}
?>
```

### PHP et MySQLi

``` php
<?php
$connecteur = new mysqli(
    "localhost",
    "root",
    "mot_de_passe",
    "nom_de_la_base"
);

$requete = "SELECT prenom, nom FROM eleve";
$resultat = $connecteur->query($requete);

while ($ligne = $resultat->fetch_assoc()) {
    print($ligne["prenom"] . " " . $ligne["nom"]);
    print("<br>");
}
?>
```

## 14. Précautions pour aller au-delà de la démonstration

Les exemples de la séance sont volontairement simples. Pour une
application réelle, plusieurs précautions sont nécessaires :

1. **Vérifier la connexion et les requêtes.** Une application doit
    traiter les erreurs avant de parcourir le résultat.
2. **Protéger les requêtes SQL.** Dès qu'une valeur provient d'un
    formulaire ou d'un utilisateur, utiliser des requêtes préparées
    plutôt que concaténer cette valeur dans la requête.
3. **Échapper les données affichées.** Une valeur issue de la base doit
    être échappée avant son insertion dans le HTML. En PHP,
    `htmlspecialchars()` répond à ce besoin dans les contextes HTML
    textuels :

``` php
print(htmlspecialchars($ligne["nom"], ENT_QUOTES, "UTF-8"));
```

4. **Protéger les identifiants de connexion.** Ne pas publier de mot de
    passe dans un dépôt public ; utiliser un compte dédié et des droits
    limités en production.
5. **Maintenir un encodage cohérent.** Vérifier l'encodage des
    fichiers, de la base et de la connexion.

Ces points complètent le cours : ils ne doivent pas être confondus avec
les manipulations effectivement réalisées pendant la démonstration.

## 15. Synthèse générale

Une page web dynamique repose sur une articulation entre plusieurs
composants :

1. la base de données stocke les contenus dans des tables structurées ;
2. la clé primaire identifie chaque enregistrement ;
3. SQL sélectionne les données et les filtre ;
4. PHP établit la connexion au SGBD et transmet les requêtes ;
5. le résultat SQL est parcouru par le programme PHP ;
6. PHP produit du HTML à partir des données récupérées ;
7. le navigateur affiche le document, mis en forme par CSS.

Le projet musical devient ainsi une première réalisation de publication
dynamique : les contenus sont stockés séparément de leur présentation et
peuvent être réutilisés dans plusieurs pages selon les requêtes
effectuées.

**Le point essentiel de la séance est l'articulation entre les couches
du système d'information, davantage que la maîtrise exhaustive du
langage PHP.**
