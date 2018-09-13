-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 22 Mai 2018 à 19:04
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_subscription` int(11) NOT NULL,
  `billing_date` date NOT NULL,
  `due_date` date NOT NULL,
  `price` double NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `date_booking` date NOT NULL,
  `begin_booking` time NOT NULL,
  `end_booking` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `credit_card`
--

CREATE TABLE `credit_card` (
  `id_credit_card` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `card_number` varchar(22) NOT NULL,
  `card_security_code` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `blocked` tinyint(4) NOT NULL DEFAULT '0',
  `name_customer` varchar(80) NOT NULL,
  `last_name_customer` varchar(80) NOT NULL,
  `phone_number_customer` char(10) NOT NULL,
  `email_customer` varchar(255) NOT NULL,
  `pseudo_customer` varchar(80) NOT NULL,
  `password_customer` varchar(255) NOT NULL,
  `code_customer` varchar(10) NOT NULL,
  `token` char(32) DEFAULT NULL,
  `inside` tinyint(4) NOT NULL DEFAULT '0',
  `is_student` tinyint(4) NOT NULL DEFAULT '0',
  `begin_subscription` datetime DEFAULT NULL,
  `end_subscription` datetime DEFAULT NULL,
  `renewal_subscription` tinyint(4) DEFAULT NULL,
  `id_subscription` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `equipment`
--

CREATE TABLE `equipment` (
  `id_equipment` int(11) NOT NULL,
  `name_equipment` varchar(100) NOT NULL,
  `reference` varchar(25) DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `id_location` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `date_entry` datetime DEFAULT NULL,
  `date_exit` datetime DEFAULT NULL,
  `id_customer` int(11) NOT NULL,
  `id_location` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `town` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `location`
--

INSERT INTO `location` (`id_location`, `town`, `address`) VALUES
(1, 'Bastille', '5 place de la Bastille 75004 PARIS'),
(2, 'Beaubourg', '15 place Georges-Pompidou 75004 PARIS'),
(3, 'Odéon', '32 place de l’Odéon 75006 PARIS'),
(4, 'Place d\'Italie', '13 place d’Italie 75013 PARIS'),
(5, 'République', '52 place de la République 75011 PARIS'),
(6, 'Ternes', '27 avenue des Ternes 75017 PARIS');

-- --------------------------------------------------------

--
-- Structure de la table `renting_equipment`
--

CREATE TABLE `renting_equipment` (
  `id_customer` int(11) NOT NULL,
  `id_equipment` int(11) NOT NULL,
  `date_rent` datetime DEFAULT NULL,
  `date_return` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
  `id_room` int(11) NOT NULL,
  `type_room` varchar(100) NOT NULL,
  `number_places` int(11) NOT NULL,
  `booked` tinyint(4) NOT NULL DEFAULT '0',
  `id_location` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `room`
--

INSERT INTO `room` (`id_room`, `type_room`, `number_places`, `booked`, `id_location`) VALUES
(1, 'Salle de réunion', 2, 0, 1),
(2, 'Salon cosy', 1, 0, 1),
(3, 'Salle d\'appel', 3, 0, 1),
(4, 'Salle de réunion', 2, 0, 2),
(5, 'Salon cosy', 1, 0, 2),
(6, 'Salle d\'appel', 3, 0, 2),
(7, 'Salle de réunion', 4, 0, 3),
(8, 'Salon cosy', 2, 0, 3),
(9, 'Salle d\'appel', 2, 0, 3),
(10, 'Salle de réunion', 5, 0, 4),
(11, 'Salon cosy', 3, 0, 4),
(12, 'Salle d\'appel', 4, 0, 4),
(13, 'Salle de réunion', 7, 0, 5),
(14, 'Salon cosy', 4, 0, 5),
(15, 'Salle d\'appel', 5, 0, 5),
(16, 'Salle de réunion', 7, 0, 6),
(17, 'Salon cosy', 4, 0, 6),
(18, 'Salle d\'appel', 5, 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `schedule`
--

CREATE TABLE `schedule` (
  `id_schedule` int(11) NOT NULL,
  `day` varchar(9) NOT NULL,
  `begin_schedule` time NOT NULL,
  `end_schedule` time NOT NULL,
  `id_location` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `schedule`
--

INSERT INTO `schedule` (`id_schedule`, `day`, `begin_schedule`, `end_schedule`, `id_location`) VALUES
(1, 'lundi', '09:00:00', '20:00:00', 1),
(2, 'mardi', '09:00:00', '20:00:00', 1),
(3, 'mercredi', '09:00:00', '20:00:00', 1),
(4, 'jeudi', '09:00:00', '20:00:00', 1),
(5, 'vendredi', '09:00:00', '20:00:00', 1),
(6, 'samedi', '11:00:00', '20:00:00', 1),
(7, 'dimanche', '11:00:00', '20:00:00', 1),
(8, 'lundi', '09:00:00', '20:00:00', 2),
(9, 'mardi', '09:00:00', '20:00:00', 2),
(10, 'mercredi', '09:00:00', '20:00:00', 2),
(11, 'jeudi', '09:00:00', '20:00:00', 2),
(12, 'vendredi', '09:00:00', '20:00:00', 2),
(13, 'samedi', '09:00:00', '20:00:00', 2),
(14, 'dimanche', '09:00:00', '20:00:00', 2),
(15, 'lundi', '09:00:00', '20:00:00', 3),
(16, 'mardi', '09:00:00', '20:00:00', 3),
(17, 'mercredi', '09:00:00', '20:00:00', 3),
(18, 'jeudi', '09:00:00', '20:00:00', 3),
(19, 'vendredi', '09:00:00', '20:00:00', 3),
(20, 'samedi', '09:00:00', '20:00:00', 3),
(21, 'dimanche', '09:00:00', '20:00:00', 3),
(22, 'lundi', '09:00:00', '20:00:00', 4),
(23, 'mardi', '09:00:00', '20:00:00', 4),
(24, 'mercredi', '09:00:00', '20:00:00', 4),
(25, 'jeudi', '09:00:00', '20:00:00', 4),
(26, 'vendredi', '09:00:00', '20:00:00', 4),
(27, 'samedi', '09:00:00', '20:00:00', 4),
(28, 'dimanche', '09:00:00', '20:00:00', 4),
(29, 'lundi', '08:00:00', '21:00:00', 5),
(30, 'mardi', '08:00:00', '21:00:00', 5),
(31, 'mercredi', '08:00:00', '21:00:00', 5),
(32, 'jeudi', '08:00:00', '21:00:00', 5),
(33, 'vendredi', '09:00:00', '23:00:00', 5),
(34, 'samedi', '09:00:00', '20:00:00', 5),
(35, 'dimanche', '09:00:00', '20:00:00', 5),
(36, 'lundi', '08:00:00', '21:00:00', 6),
(37, 'mardi', '08:00:00', '21:00:00', 6),
(38, 'mercredi', '08:00:00', '21:00:00', 6),
(39, 'jeudi', '08:00:00', '21:00:00', 6),
(40, 'vendredi', '09:00:00', '23:00:00', 6),
(41, 'samedi', '09:00:00', '20:00:00', 6),
(42, 'dimanche', '09:00:00', '20:00:00', 6);

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

CREATE TABLE `staff` (
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `id_customer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `staff_ticket`
--

CREATE TABLE `staff_ticket` (
  `id_ticket` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `subscription`
--

CREATE TABLE `subscription` (
  `id_subscription` int(11) NOT NULL,
  `type_subscription` varchar(255) NOT NULL,
  `price_with_engagement` double DEFAULT NULL,
  `price_without_engagement` double DEFAULT NULL,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `subscription`
--

INSERT INTO `subscription` (`id_subscription`, `type_subscription`, `price_with_engagement`, `price_without_engagement`, `description`) VALUES
(1, 'Sans abonnement', 0, 0, 'Description sans abonnement'),
(2, 'Abonnement simple', 20, 24, 'Description abonnement simple'),
(3, 'Abonnement résident', 252, 300, 'Description abonnement résident');

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `id_customer` int(11) NOT NULL,
  `id_equipment` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ticket_message`
--

CREATE TABLE `ticket_message` (
  `id_message` int(11) NOT NULL,
  `message` longtext,
  `message_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_ticket` int(11) DEFAULT NULL,
  `id_customer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_bill`);

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Index pour la table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`id_credit_card`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Index pour la table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id_equipment`),
  ADD UNIQUE KEY `reference` (`reference`);

--
-- Index pour la table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`);

--
-- Index pour la table `renting_equipment`
--
ALTER TABLE `renting_equipment`
  ADD PRIMARY KEY (`id_customer`,`id_equipment`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id_room`);

--
-- Index pour la table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id_schedule`);

--
-- Index pour la table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_customer`);

--
-- Index pour la table `staff_ticket`
--
ALTER TABLE `staff_ticket`
  ADD PRIMARY KEY (`id_ticket`,`id_customer`);

--
-- Index pour la table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id_subscription`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`);

--
-- Index pour la table `ticket_message`
--
ALTER TABLE `ticket_message`
  ADD PRIMARY KEY (`id_message`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bill`
--
ALTER TABLE `bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `credit_card`
--
ALTER TABLE `credit_card`
  MODIFY `id_credit_card` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id_equipment` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `room`
--
ALTER TABLE `room`
  MODIFY `id_room` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id_schedule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT pour la table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id_subscription` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ticket_message`
--
ALTER TABLE `ticket_message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
