-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 04 déc. 2017 à 13:49
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ith`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartement`
--

DROP TABLE IF EXISTS `appartement`;
CREATE TABLE IF NOT EXISTS `appartement` (
  `id_habitation` int(11) NOT NULL,
  `num_bat` tinyint(11) NOT NULL,
  `etage_appart` smallint(11) NOT NULL,
  `id_immeuble` int(11) NOT NULL,
  PRIMARY KEY (`id_habitation`),
  KEY `APPARTEMENT_IMMEUBLE_FK` (`id_immeuble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `capteur`
--

DROP TABLE IF EXISTS `capteur`;
CREATE TABLE IF NOT EXISTS `capteur` (
  `id_ca` int(11) NOT NULL AUTO_INCREMENT,
  `power_state` tinyint(1) NOT NULL,
  `powered_timestamp` int(11) NOT NULL,
  `shutdown_timestamp` int(11) NOT NULL,
  `id_piece` int(11) NOT NULL,
  PRIMARY KEY (`id_ca`),
  KEY `CAPTEUR_PIECE_FK` (`id_piece`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `co2`
--

DROP TABLE IF EXISTS `co2`;
CREATE TABLE IF NOT EXISTS `co2` (
  `id_ca` int(11) NOT NULL,
  `taux_CO2` tinyint(4) NOT NULL,
  `timestamp_co2` int(11) NOT NULL,
  PRIMARY KEY (`id_ca`),
  UNIQUE KEY `timestamp_co2` (`timestamp_co2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `employe_municipal`
--

DROP TABLE IF EXISTS `employe_municipal`;
CREATE TABLE IF NOT EXISTS `employe_municipal` (
  `email_u` varchar(150) NOT NULL,
  `id_ville` int(11) NOT NULL,
  PRIMARY KEY (`email_u`),
  KEY `EMPLOYE_MUNICIPAL_VILLE_FK` (`id_ville`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fumee`
--

DROP TABLE IF EXISTS `fumee`;
CREATE TABLE IF NOT EXISTS `fumee` (
  `id_ca` int(11) NOT NULL,
  `fumee` tinyint(1) NOT NULL,
  `timestamp_fumee` int(11) NOT NULL,
  PRIMARY KEY (`id_ca`),
  UNIQUE KEY `timestamp_fumee` (`timestamp_fumee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gardien`
--

DROP TABLE IF EXISTS `gardien`;
CREATE TABLE IF NOT EXISTS `gardien` (
  `email_u` varchar(150) NOT NULL,
  PRIMARY KEY (`email_u`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

DROP TABLE IF EXISTS `gerant`;
CREATE TABLE IF NOT EXISTS `gerant` (
  `id_gerant` int(11) NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `id_habitation` int(11) NOT NULL,
  `email_u` varchar(150) NOT NULL,
  PRIMARY KEY (`id_gerant`),
  KEY `GERANT_HABITATION_FK` (`id_habitation`),
  KEY `GERANT_UTILISATEUR_FK` (`email_u`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `habitation`
--

DROP TABLE IF EXISTS `habitation`;
CREATE TABLE IF NOT EXISTS `habitation` (
  `id_habitation` int(11) NOT NULL AUTO_INCREMENT,
  `pays_habitation` varchar(40) NOT NULL,
  `num_rue_habitation` smallint(6) NOT NULL,
  `rue_habitation` varchar(150) NOT NULL,
  `sup_habitation` smallint(6) NOT NULL,
  PRIMARY KEY (`id_habitation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `humidite`
--

DROP TABLE IF EXISTS `humidite`;
CREATE TABLE IF NOT EXISTS `humidite` (
  `id_ca` int(11) NOT NULL,
  `taux_humidite` tinyint(4) NOT NULL,
  `timestamp_humidite` int(11) NOT NULL,
  PRIMARY KEY (`id_ca`),
  UNIQUE KEY `timestamp_humidite` (`timestamp_humidite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `immeuble`
--

DROP TABLE IF EXISTS `immeuble`;
CREATE TABLE IF NOT EXISTS `immeuble` (
  `id_immeuble` int(11) NOT NULL AUTO_INCREMENT,
  `id_quartier` int(11) NOT NULL,
  `email_u` varchar(150) NOT NULL,
  PRIMARY KEY (`id_immeuble`),
  KEY `IMMEUBLE_QUARTIER_FK` (`id_quartier`),
  KEY `IMMEUBLE_GARDIEN_FK` (`email_u`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ensemble d''appartements';

-- --------------------------------------------------------

--
-- Structure de la table `luminosite`
--

DROP TABLE IF EXISTS `luminosite`;
CREATE TABLE IF NOT EXISTS `luminosite` (
  `id_ca` int(11) NOT NULL,
  `taux_luminosite` tinyint(4) NOT NULL,
  `timestamp_luminosite` int(11) NOT NULL,
  PRIMARY KEY (`id_ca`),
  UNIQUE KEY `timestamp_luminosite` (`timestamp_luminosite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `maison`
--

DROP TABLE IF EXISTS `maison`;
CREATE TABLE IF NOT EXISTS `maison` (
  `id_habitation` int(11) NOT NULL,
  `nb_etage` tinyint(11) NOT NULL,
  `id_quartier` int(11) NOT NULL,
  PRIMARY KEY (`id_habitation`),
  KEY `MAISON_QUARTIER_FK` (`id_quartier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `piece`
--

DROP TABLE IF EXISTS `piece`;
CREATE TABLE IF NOT EXISTS `piece` (
  `id_piece` int(11) NOT NULL AUTO_INCREMENT,
  `type_piece` varchar(100) NOT NULL,
  `long_piece` smallint(11) NOT NULL,
  `largeur_piece` smallint(11) NOT NULL,
  `hauteur_piece` smallint(11) NOT NULL,
  `id_gerant` int(11) NOT NULL,
  PRIMARY KEY (`id_piece`),
  KEY `PIECE_GERANT_FK` (`id_gerant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `presence`
--

DROP TABLE IF EXISTS `presence`;
CREATE TABLE IF NOT EXISTS `presence` (
  `id_ca` int(11) NOT NULL,
  `presence` tinyint(1) NOT NULL,
  `timestamp_temperature` int(11) NOT NULL,
  PRIMARY KEY (`id_ca`),
  UNIQUE KEY `timestamp_temperature` (`timestamp_temperature`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `quartier`
--

DROP TABLE IF EXISTS `quartier`;
CREATE TABLE IF NOT EXISTS `quartier` (
  `id_quartier` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `id_ville` int(11) NOT NULL,
  PRIMARY KEY (`id_quartier`),
  KEY `QUARTIER_VILLE_FK` (`id_ville`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `temperature`
--

DROP TABLE IF EXISTS `temperature`;
CREATE TABLE IF NOT EXISTS `temperature` (
  `id_ca` int(11) NOT NULL,
  `temperature` tinyint(4) NOT NULL,
  `timestamp_temperature` int(11) NOT NULL,
  PRIMARY KEY (`id_ca`),
  UNIQUE KEY `timestamp_temperature` (`timestamp_temperature`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `email_u` varchar(150) NOT NULL,
  `prenom_u` varchar(100) NOT NULL,
  `nom_u` varchar(100) NOT NULL,
  `mdp_u` varchar(100) DEFAULT NULL,
  `clef_u` int(11) NOT NULL,
  PRIMARY KEY (`email_u`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id_ville` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ville`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `APPARTEMENT_HABITATION_PK_FK` FOREIGN KEY (`id_habitation`) REFERENCES `habitation` (`id_habitation`) ON DELETE CASCADE,
  ADD CONSTRAINT `APPARTEMENT_IMMEUBLE_FK` FOREIGN KEY (`id_immeuble`) REFERENCES `immeuble` (`id_immeuble`) ON DELETE CASCADE;

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `CAPTEUR_PIECE_FK` FOREIGN KEY (`id_piece`) REFERENCES `piece` (`id_piece`) ON DELETE CASCADE;

--
-- Contraintes pour la table `co2`
--
ALTER TABLE `co2`
  ADD CONSTRAINT `CO2_CAPTEUR_FK` FOREIGN KEY (`id_ca`) REFERENCES `capteur` (`id_ca`) ON DELETE CASCADE;

--
-- Contraintes pour la table `employe_municipal`
--
ALTER TABLE `employe_municipal`
  ADD CONSTRAINT `EMPLOYE_MUNICIPAL_UTILISATEUR_FK` FOREIGN KEY (`email_u`) REFERENCES `utilisateur` (`email_u`) ON DELETE CASCADE,
  ADD CONSTRAINT `EMPLOYE_MUNICIPAL_VILLE_FK` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fumee`
--
ALTER TABLE `fumee`
  ADD CONSTRAINT `FUMEE_CAPTEUR_FK` FOREIGN KEY (`id_ca`) REFERENCES `capteur` (`id_ca`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gardien`
--
ALTER TABLE `gardien`
  ADD CONSTRAINT `GARDIEN_UTILISATEUR_FK` FOREIGN KEY (`email_u`) REFERENCES `utilisateur` (`email_u`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gerant`
--
ALTER TABLE `gerant`
  ADD CONSTRAINT `GERANT_HABITATION_FK` FOREIGN KEY (`id_habitation`) REFERENCES `habitation` (`id_habitation`) ON DELETE CASCADE,
  ADD CONSTRAINT `GERANT_UTILISATEUR_FK` FOREIGN KEY (`email_u`) REFERENCES `utilisateur` (`email_u`) ON DELETE CASCADE;

--
-- Contraintes pour la table `humidite`
--
ALTER TABLE `humidite`
  ADD CONSTRAINT `HUMIDITE_CAPTEUR_FK` FOREIGN KEY (`id_ca`) REFERENCES `capteur` (`id_ca`) ON DELETE CASCADE;

--
-- Contraintes pour la table `immeuble`
--
ALTER TABLE `immeuble`
  ADD CONSTRAINT `IMMEUBLE_GARDIEN_FK` FOREIGN KEY (`email_u`) REFERENCES `gardien` (`email_u`) ON DELETE CASCADE,
  ADD CONSTRAINT `IMMEUBLE_QUARTIER_FK` FOREIGN KEY (`id_quartier`) REFERENCES `quartier` (`id_quartier`) ON DELETE CASCADE;

--
-- Contraintes pour la table `luminosite`
--
ALTER TABLE `luminosite`
  ADD CONSTRAINT `LUMINOSITE_CAPTEUR_FK` FOREIGN KEY (`id_ca`) REFERENCES `capteur` (`id_ca`) ON DELETE CASCADE;

--
-- Contraintes pour la table `maison`
--
ALTER TABLE `maison`
  ADD CONSTRAINT `MAISON_HABITATION_PK_FK` FOREIGN KEY (`id_habitation`) REFERENCES `habitation` (`id_habitation`) ON DELETE CASCADE,
  ADD CONSTRAINT `MAISON_QUARTIER_FK` FOREIGN KEY (`id_quartier`) REFERENCES `quartier` (`id_quartier`) ON DELETE CASCADE;

--
-- Contraintes pour la table `piece`
--
ALTER TABLE `piece`
  ADD CONSTRAINT `PIECE_GERANT_FK` FOREIGN KEY (`id_gerant`) REFERENCES `gerant` (`id_gerant`) ON DELETE CASCADE;

--
-- Contraintes pour la table `presence`
--
ALTER TABLE `presence`
  ADD CONSTRAINT `PRESENCE_CAPTEUR_FK` FOREIGN KEY (`id_ca`) REFERENCES `capteur` (`id_ca`) ON DELETE CASCADE;

--
-- Contraintes pour la table `quartier`
--
ALTER TABLE `quartier`
  ADD CONSTRAINT `QUARTIER_VILLE_FK` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`) ON DELETE CASCADE;

--
-- Contraintes pour la table `temperature`
--
ALTER TABLE `temperature`
  ADD CONSTRAINT `TEMPERATURE_CAPTEUR_FK` FOREIGN KEY (`id_ca`) REFERENCES `capteur` (`id_ca`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
