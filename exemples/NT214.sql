-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 03 nov. 2026 à 20:02
-- Version du serveur : 8.0.44
-- Version de PHP : 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `promo_NTD_214_2026`
--
CREATE DATABASE IF NOT EXISTS `promo_NTD_214_2026` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `promo_NTD_214_2026`;

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE `eleves` (
  `id_eleves` tinyint NOT NULL,
  `prenom` varchar(32) NOT NULL,
  `nom` varchar(32) NOT NULL,
  `ville` varchar(32) NOT NULL,
  `metier` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`id_eleves`, `prenom`, `nom`, `ville`, `metier`) VALUES
(1, 'Xavier', 'Aymé', 'Nantes', 'Enseignant'),
(2, 'Claire', 'Scopsi', 'Paris', 'Enseignant'),
(3, 'Alice', 'Dirwimmer', 'Strasbourg', 'Photographe'),
(4, 'Aude', 'Grégoire', 'Le Mans', 'Bibliothécaire'),
(5, 'Mathilde', 'Cheval', 'Saint André de Najac', 'Repéreuse'),
(6, 'Elise', 'Heymes', 'Paris', 'Rédactrice'),
(7, 'Ananay', 'Arango', 'Paris', 'Artiste'),
(8, 'Océane', 'Calvez', 'Montrouge', 'Graphiste'),
(9, 'Gérald', 'Kembellec', 'Chantilly', 'Enseignant'),
(10, 'Evelyne', 'Descamps', 'Comines', 'Documentaliste'),
(11, 'Sarah', 'Guillemain', 'Provins', 'Enseignant');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD PRIMARY KEY (`id_eleves`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `eleves`
--
ALTER TABLE `eleves`
  MODIFY `id_eleves` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
