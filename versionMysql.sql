-- phpMyAdmin SQL Dump
-- version 3.5.6
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 21 Février 2014 à 14:08
-- Version du serveur: 5.5.31-0+wheezy1-log
-- Version de PHP: 5.4.4-14+deb7u7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `E103642E`
--

-- --------------------------------------------------------

--
-- Structure de la table `CompteBancaire`
--

CREATE TABLE IF NOT EXISTS `CompteBancaire` (
  `iban` varchar(34) NOT NULL,
  `solde` int(11) NOT NULL,
  `codeBancaire` int(11) NOT NULL,
  `proprietaireCompteBancaire` int(11) NOT NULL,
  PRIMARY KEY (`iban`),
  KEY `proprietaireCompteBancaire` (`proprietaireCompteBancaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Conversation`
--

CREATE TABLE IF NOT EXISTS `Conversation` (
  `idConv` int(11) NOT NULL AUTO_INCREMENT,
  `dateHeureConv` datetime NOT NULL,
  `typeConv` enum('Telephone','Mail','Sms','Pigeon Voyageur','Bouteille a la mer') NOT NULL,
  `contenuConv` text NOT NULL,
  `allocuteur1` int(11) NOT NULL,
  `allocuteur2` int(11) NOT NULL,
  PRIMARY KEY (`idConv`),
  KEY `allocuteur1` (`allocuteur1`,`allocuteur2`),
  KEY `allocuteur2` (`allocuteur2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Employe`
--

CREATE TABLE IF NOT EXISTS `Employe` (
  `idPersonne` int(11) NOT NULL,
  `idEntreprise` int(11) NOT NULL,
  `statutEmploye` varchar(255) NOT NULL,
  PRIMARY KEY (`idPersonne`,`idEntreprise`),
  KEY `idEntreprise` (`idEntreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Entreprise`
--

CREATE TABLE IF NOT EXISTS `Entreprise` (
  `idEntreprise` int(11) NOT NULL AUTO_INCREMENT,
  `nomEntreprise` varchar(255) NOT NULL,
  `statutEntreprise` varchar(255) NOT NULL,
  PRIMARY KEY (`idEntreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Mail`
--

CREATE TABLE IF NOT EXISTS `Mail` (
  `adresseMail` varchar(255) NOT NULL,
  `mdpMail` varchar(255) NOT NULL,
  `proprietaireMail` int(11) NOT NULL,
  PRIMARY KEY (`adresseMail`),
  KEY `proprietaireMail` (`proprietaireMail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Personne`
--

CREATE TABLE IF NOT EXISTS `Personne` (
  `idPersonne` int(255) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sexe` enum('Homme','Femme') CHARACTER SET utf8 NOT NULL,
  `dateNaissance` date NOT NULL,
  `adressePrincipale` varchar(255) CHARACTER SET utf8 NOT NULL,
  `descriptionPhysique` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idPersonne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `Prioritaire`
--

CREATE TABLE IF NOT EXISTS `Prioritaire` (
  `statutPrioritaire` varchar(255) NOT NULL,
  PRIMARY KEY (`statutPrioritaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Relation`
--

CREATE TABLE IF NOT EXISTS `Relation` (
  `emetteur` int(11) NOT NULL,
  `recepteur` int(11) NOT NULL,
  `typeRelation` enum('Amitie','Mariage','Divorce','Adultere','Connaissance','Ennemi') NOT NULL,
  `contexteRelation` enum('Travail','Famille','Etude','Internet') NOT NULL,
  PRIMARY KEY (`emetteur`,`recepteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Telephone`
--

CREATE TABLE IF NOT EXISTS `Telephone` (
  `numTelephone` varchar(255) NOT NULL,
  `codePin` int(11) NOT NULL,
  `proprietaireTelephone` int(11) NOT NULL,
  PRIMARY KEY (`numTelephone`),
  KEY `proprietaireTelephone` (`proprietaireTelephone`),
  KEY `proprietaireTelephone_2` (`proprietaireTelephone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `CompteBancaire`
--
ALTER TABLE `CompteBancaire`
  ADD CONSTRAINT `CompteBancaire_ibfk_1` FOREIGN KEY (`proprietaireCompteBancaire`) REFERENCES `Personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Conversation`
--
ALTER TABLE `Conversation`
  ADD CONSTRAINT `Conversation_ibfk_2` FOREIGN KEY (`allocuteur2`) REFERENCES `Personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Conversation_ibfk_1` FOREIGN KEY (`allocuteur1`) REFERENCES `Personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Employe`
--
ALTER TABLE `Employe`
  ADD CONSTRAINT `Employe_ibfk_2` FOREIGN KEY (`idPersonne`) REFERENCES `Personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Employe_ibfk_1` FOREIGN KEY (`idEntreprise`) REFERENCES `Entreprise` (`idEntreprise`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Mail`
--
ALTER TABLE `Mail`
  ADD CONSTRAINT `Mail_ibfk_1` FOREIGN KEY (`proprietaireMail`) REFERENCES `Personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Telephone`
--
ALTER TABLE `Telephone`
  ADD CONSTRAINT `Telephone_ibfk_1` FOREIGN KEY (`proprietaireTelephone`) REFERENCES `Personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
