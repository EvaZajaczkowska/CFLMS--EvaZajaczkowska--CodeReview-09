-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Jul 2020 um 11:53
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_Eva_Zajaczkowska_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_Eva_Zajaczkowska_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_Eva_Zajaczkowska_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `country`
--

CREATE TABLE `country` (
  `country_code` int(15) NOT NULL,
  `country_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `country`
--

INSERT INTO `country` (`country_code`, `country_name`) VALUES
(12, 'austria'),
(13, 'syrien'),
(14, 'italien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id_false` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `delivery`
--

INSERT INTO `delivery` (`delivery_id_false`) VALUES
(34),
(45),
(15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery2`
--

CREATE TABLE `delivery2` (
  `delivery_id` int(25) NOT NULL,
  `fk_employee_id` int(11) NOT NULL,
  `delivery_timedate` datetime NOT NULL,
  `fk_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `fk_po_branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `fk_po_branch_id`) VALUES
(34, 'unbekannte', 'frau', 34),
(78, 'Alex', 'tau', 1),
(99, 'stefan', 'zur', 35);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `item_id` int(25) NOT NULL,
  `fk_type` int(25) NOT NULL,
  `fk_recipient_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`item_id`, `fk_type`, `fk_recipient_id`) VALUES
(12, 11, 2),
(56, 89, 3),
(98, 45, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post_code`
--

CREATE TABLE `post_code` (
  `post_code` int(25) NOT NULL,
  `city_name` varchar(25) NOT NULL,
  `fk_country_code` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `post_code`
--

INSERT INTO `post_code` (`post_code`, `city_name`, `fk_country_code`) VALUES
(12, 'Vienna', 12),
(33, 'venedig', 14),
(99, 'Damaskus', 13);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post_office_branch`
--

CREATE TABLE `post_office_branch` (
  `branch_id` int(25) NOT NULL,
  `fk_post_code` int(11) NOT NULL,
  `address` varchar(25) NOT NULL,
  `post_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `post_office_branch`
--

INSERT INTO `post_office_branch` (`branch_id`, `fk_post_code`, `address`, `post_name`) VALUES
(1, 12, 'stephansplatz', '4'),
(34, 33, 'venedigstreet', '2'),
(35, 99, 'Damaskusstreet', '7');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `fk_post_code` int(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `fk_post_code`, `country`, `address`) VALUES
(2, 'amat', 'anna', 99, 'austria', 'karlsstreet'),
(3, 'francesco', 'air ', 33, 'austria', 'landstraße'),
(56, 'eva', 'maria', 12, 'austria', 'einfachestraße'),
(89, 'Susi ', 'italioano ', 33, 'austria', 'straße');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Registration`
--

CREATE TABLE `Registration` (
  `registration_id` int(25) NOT NULL,
  `fk_item_id` int(11) NOT NULL,
  `fk_reg_emp_id` int(11) NOT NULL,
  `fk_delivery_branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Registration`
--

INSERT INTO `Registration` (`registration_id`, `fk_item_id`, `fk_reg_emp_id`, `fk_delivery_branch_id`) VALUES
(34, 12, 99, 1),
(67, 56, 34, 35),
(78, 98, 34, 34);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `type`
--

CREATE TABLE `type` (
  `type_id` int(25) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `type`
--

INSERT INTO `type` (`type_id`, `type`) VALUES
(11, 'letter'),
(45, 'package'),
(89, 'premiumpackage');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_code`);

--
-- Indizes für die Tabelle `delivery2`
--
ALTER TABLE `delivery2`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_po_branch_id` (`fk_po_branch_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_type` (`fk_type`),
  ADD KEY `fk_recipient_id` (`fk_recipient_id`);

--
-- Indizes für die Tabelle `post_code`
--
ALTER TABLE `post_code`
  ADD PRIMARY KEY (`post_code`),
  ADD KEY `fk_country_code` (`fk_country_code`);

--
-- Indizes für die Tabelle `post_office_branch`
--
ALTER TABLE `post_office_branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `fk_post_code` (`fk_post_code`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_post_code` (`fk_post_code`);

--
-- Indizes für die Tabelle `Registration`
--
ALTER TABLE `Registration`
  ADD PRIMARY KEY (`registration_id`),
  ADD KEY `fk_delivery_branch_id` (`fk_delivery_branch_id`),
  ADD KEY `fk_reg_emp_id` (`fk_reg_emp_id`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Indizes für die Tabelle `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `country`
--
ALTER TABLE `country`
  MODIFY `country_code` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `delivery2`
--
ALTER TABLE `delivery2`
  MODIFY `delivery_id` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `item_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT für Tabelle `post_code`
--
ALTER TABLE `post_code`
  MODIFY `post_code` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT für Tabelle `post_office_branch`
--
ALTER TABLE `post_office_branch`
  MODIFY `branch_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT für Tabelle `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT für Tabelle `Registration`
--
ALTER TABLE `Registration`
  MODIFY `registration_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT für Tabelle `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `delivery2`
--
ALTER TABLE `delivery2`
  ADD CONSTRAINT `delivery2_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `delivery2_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `package` (`item_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_po_branch_id`) REFERENCES `post_office_branch` (`branch_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_type`) REFERENCES `type` (`type_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`);

--
-- Constraints der Tabelle `post_code`
--
ALTER TABLE `post_code`
  ADD CONSTRAINT `post_code_ibfk_1` FOREIGN KEY (`fk_country_code`) REFERENCES `country` (`country_code`);

--
-- Constraints der Tabelle `post_office_branch`
--
ALTER TABLE `post_office_branch`
  ADD CONSTRAINT `post_office_branch_ibfk_1` FOREIGN KEY (`fk_post_code`) REFERENCES `post_code` (`post_code`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_post_code`) REFERENCES `post_code` (`post_code`);

--
-- Constraints der Tabelle `Registration`
--
ALTER TABLE `Registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`fk_delivery_branch_id`) REFERENCES `post_office_branch` (`branch_id`),
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`fk_reg_emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `registration_ibfk_3` FOREIGN KEY (`fk_item_id`) REFERENCES `package` (`item_id`),
  ADD CONSTRAINT `registration_ibfk_4` FOREIGN KEY (`fk_item_id`) REFERENCES `package` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
