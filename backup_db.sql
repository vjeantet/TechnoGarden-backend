-- phpMyAdmin SQL Dump
-- version 4.1.9
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 24, 2014 at 08:12 PM
-- Server version: 5.5.36
-- PHP Version: 5.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `technogarden`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_team`
--

CREATE TABLE IF NOT EXISTS `event_team` (
  `id_event` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_event`,`id_team`),
  KEY `id_team` (`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_techno`
--

CREATE TABLE IF NOT EXISTS `event_techno` (
  `id_event` int(11) NOT NULL,
  `id_techno` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_event`,`id_techno`),
  KEY `id_techno` (`id_techno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_user`
--

CREATE TABLE IF NOT EXISTS `event_user` (
  `id_event` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_event`,`id_user`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `summary`, `location`) VALUES
(1, 'Techno Garden', 'An awesome techno garden', 'paris'),
(2, 'WIP', 'Work In Progress', 'Paris'),
(3, 'Noblabla', '', 'Paris'),
(4, 'Aptenodytes', '', 'Paris'),
(5, 'Hubble', '', 'Paris'),
(6, 'Bubble', '', 'Paris');

-- --------------------------------------------------------

--
-- Table structure for table `team_techno`
--

CREATE TABLE IF NOT EXISTS `team_techno` (
  `id_team` int(11) NOT NULL,
  `id_techno` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `level_usage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_team`,`id_techno`),
  KEY `id_techno` (`id_techno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team_techno`
--

INSERT INTO `team_techno` (`id_team`, `id_techno`, `created_on`, `level_usage`) VALUES
(1, 1, '2014-05-24 14:34:44', NULL),
(1, 2, '2014-05-24 14:34:44', NULL),
(1, 5, '2014-05-24 14:34:44', NULL),
(1, 6, '2014-05-24 14:34:44', NULL),
(1, 12, '2014-05-24 14:34:44', NULL),
(1, 15, '2014-05-24 14:34:44', NULL),
(2, 1, '2014-05-24 14:34:44', NULL),
(2, 3, '2014-05-24 14:34:44', NULL),
(2, 4, '2014-05-24 14:34:44', NULL),
(2, 5, '2014-05-24 14:34:44', NULL),
(2, 6, '2014-05-24 14:34:44', NULL),
(3, 7, '2014-05-24 14:34:44', NULL),
(3, 8, '2014-05-24 14:34:44', NULL),
(4, 7, '2014-05-24 14:34:44', NULL),
(4, 9, '2014-05-24 14:34:44', NULL),
(4, 10, '2014-05-24 14:34:44', NULL),
(4, 11, '2014-05-24 14:34:44', NULL),
(4, 12, '2014-05-24 14:34:44', NULL),
(5, 5, '2014-05-24 14:34:44', NULL),
(5, 6, '2014-05-24 14:34:44', NULL),
(5, 12, '2014-05-24 14:34:44', NULL),
(5, 13, '2014-05-24 14:34:44', NULL),
(6, 1, '2014-05-24 14:34:44', NULL),
(6, 2, '2014-05-24 14:34:44', NULL),
(6, 5, '2014-05-24 14:34:44', NULL),
(6, 14, '2014-05-24 14:34:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `techno`
--

CREATE TABLE IF NOT EXISTS `techno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `code_2` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `techno`
--

INSERT INTO `techno` (`id`, `label`, `description`, `type`, `code`) VALUES
(1, 'PHP', 'PHP', 'language', 'php'),
(2, 'Javascript', 'Javascript', 'language', 'js'),
(3, 'JQuery', 'Simplified Javascript', 'library', 'jquery'),
(4, 'GitHub API', 'Github''s Api', 'API', 'github'),
(5, 'HTML5', 'HTML5', 'language', 'html'),
(6, 'CSS', 'CSS', 'language', 'css'),
(7, 'Java', 'Java', 'language', 'java'),
(8, 'XML', 'XML', 'language', 'xml'),
(9, 'J2EE', 'Java 2 Platform Enterprise Edition', 'platform', 'j2ee'),
(10, 'Spring', 'The Spring Framework is an open source application framework and inversion of control container for the Java platform.', 'framework', 'spring'),
(11, 'Hibernate', 'Hibernate ORM (Hibernate in short) is an object-relational mapping library for the Java language', 'library', 'hiber'),
(12, 'AngularJS', 'AngularJS is an open-source web application framework, that assists with creating single-page applications, one-page web applications that only require HTML, CSS, and JavaScript on the client side.', 'framework', 'ang'),
(13, 'Bootstrap', 'A collection of tools for creating websites and web applications. It contains HTML and CSS-based design templates for typography, forms, buttons, navigation and other interface components, as well as optional JavaScript extensions.', 'framework', 'boot'),
(14, '3dJS', 'A 3D JavaScript library', 'library', '3djs'),
(15, 'Drupal', 'Drupal is an open source content management platform ', 'platform', 'drupal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `IMusernme` varchar(255) NOT NULL,
  `teamname` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `IMusernme`, `teamname`, `username`) VALUES
(1, 'Florence', 'BECK', 'fbeck@student.42.fr', 'fbeck', 'Techno Garden', 'fbeck'),
(2, 'Valere', 'JEANTET', 'valere.jeantet@gmail.com', 'vjeantet', 'Techno Garden', 'vjeantet'),
(3, 'Meriadec', 'PILLET', 'mpillet@student.42.fr', 'mpillet', 'Techno Garden', 'mpillet'),
(4, 'Jasmin', 'ANTEUNIS', 'janteuni@student.42.fr', 'janteuni', 'Techno Garden', 'janteuni'),
(5, 'Balthazar', 'GRONON', 'bgronon@student.42.fr', 'bgronon', 'Techno Garden', 'bgronon'),
(6, 'Thomas', 'GUILLIER', 'thomas.guillier@gmail.com', 'tguillier', 'Techno Garden', 'tguillier'),
(7, 'JB', 'INGOLD', 'ingold.jb@gmail.com', 'jbingold', 'Techno Garden', 'jbingold'),
(8, 'Melodie', 'SAGODIRA', 'msagodir@studet.42.fr', 'msagodir', 'WIP', 'msagodir'),
(9, 'Remi', 'BRIEUC', 'rbrieuc@student.42.fr', 'rbrieuc', 'WIP', 'rbrieuc'),
(10, 'Yann', 'PRINGAULT', 'ypringau@student.42.fr', 'ypringau', 'WIP', 'ypringau'),
(13, 'Hugo', 'MASSING', 'hmassing@student.42.fr', 'hmassing', 'WIP', 'hmassing'),
(14, 'Adrien', 'AUER', 'aaeur@student.42.fr', 'aaeur', 'WIP', 'aaeur'),
(15, 'Pierre', '', 'pierre@mail.fr', 'pierre', 'Noblabla', 'pierre'),
(16, 'Kevin', '', 'kevin@mail.fr', 'kevin', 'Noblabla', 'kevin'),
(17, 'Ahmed', '', 'ahmed@mail.fr', 'ahmed', 'Noblabla', 'ahmed'),
(18, 'Jeremy', 'Drouet', 'jdrouet@mail.fr', 'jdrouet', 'Aptenodytes', 'jdrouet'),
(19, 'Yann', 'Bonsens', 'ybonsens@mail.fr', 'ybonsens', 'Aptenodytes', 'ybonsens'),
(20, 'Marie', '', 'marie@mail.fr', 'marie', 'Hubble', 'marie'),
(21, 'Brice', '', 'brice@mail.fr', 'brice', 'Hubble', 'brice'),
(22, 'Fabien', '', 'fabien@mail.fr', 'fabien', 'Hubble', 'fabien'),
(23, 'Waiki', '', 'waiki@mail.fr', 'waiki', 'Hubble', 'waiki'),
(24, 'Selim', '', 'sbenhabb@student.42.fr', 'sbenhabb', 'Bubble', 'sbenhabb'),
(25, 'Fernand', '', 'fernand@mail.fr', 'fernand', 'Bubble', 'fernand'),
(26, 'Andre', '', 'andre@mail.fr', 'andre', 'Bubble', 'andre'),
(27, 'Corentin', '', 'corentin@mail.fr', 'corentin', 'Bubble', 'corentin');

-- --------------------------------------------------------

--
-- Table structure for table `user_team`
--

CREATE TABLE IF NOT EXISTS `user_team` (
  `id_user` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `id_techno` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`id_team`,`id_techno`),
  KEY `id_team` (`id_team`),
  KEY `id_techno` (`id_techno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_team`
--

INSERT INTO `user_team` (`id_user`, `id_team`, `id_techno`, `created_on`) VALUES
(1, 1, 1, '2014-05-24 14:36:57'),
(2, 1, 1, '2014-05-24 14:36:57'),
(3, 1, 1, '2014-05-24 14:36:57'),
(4, 1, 1, '2014-05-24 14:36:57'),
(5, 1, 1, '2014-05-24 14:36:57'),
(6, 1, 1, '2014-05-24 14:36:57'),
(7, 1, 1, '2014-05-24 14:36:57'),
(8, 2, 1, '2014-05-24 14:36:57'),
(9, 2, 1, '2014-05-24 14:36:57'),
(10, 2, 1, '2014-05-24 14:36:57'),
(13, 2, 1, '2014-05-24 14:36:57'),
(14, 2, 1, '2014-05-24 14:36:57'),
(15, 3, 1, '2014-05-24 14:36:57'),
(16, 3, 1, '2014-05-24 14:36:57'),
(17, 3, 1, '2014-05-24 14:36:57'),
(18, 4, 1, '2014-05-24 14:36:57'),
(19, 4, 1, '2014-05-24 14:36:57'),
(20, 5, 1, '2014-05-24 14:36:57'),
(21, 5, 1, '2014-05-24 14:36:57'),
(22, 5, 1, '2014-05-24 14:36:57'),
(23, 5, 1, '2014-05-24 14:36:57'),
(24, 6, 1, '2014-05-24 14:36:57'),
(25, 6, 1, '2014-05-24 14:36:57'),
(26, 6, 1, '2014-05-24 14:36:57'),
(27, 6, 1, '2014-05-24 14:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_techno`
--

CREATE TABLE IF NOT EXISTS `user_techno` (
  `id_user` int(11) NOT NULL,
  `id_techno` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `level_interest` int(11) DEFAULT NULL,
  `level_skill` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_techno`),
  KEY `id_techno` (`id_techno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_techno`
--

INSERT INTO `user_techno` (`id_user`, `id_techno`, `created_on`, `level_interest`, `level_skill`) VALUES
(1, 1, '2014-05-24 15:19:53', NULL, NULL),
(1, 12, '2014-05-24 15:19:53', NULL, NULL),
(1, 13, '2014-05-24 15:19:53', NULL, NULL),
(2, 1, '2014-05-24 15:20:33', NULL, NULL),
(2, 13, '2014-05-24 15:20:33', NULL, NULL),
(3, 2, '2014-05-24 15:20:52', NULL, NULL),
(3, 6, '2014-05-24 15:21:05', NULL, NULL),
(3, 12, '2014-05-24 15:20:52', NULL, NULL),
(6, 15, '2014-05-24 15:20:52', NULL, NULL),
(7, 15, '2014-05-24 15:20:52', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_team`
--
ALTER TABLE `event_team`
  ADD CONSTRAINT `event_team_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `event_team_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`);

--
-- Constraints for table `event_techno`
--
ALTER TABLE `event_techno`
  ADD CONSTRAINT `event_techno_ibfk_2` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`),
  ADD CONSTRAINT `event_techno_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`);

--
-- Constraints for table `event_user`
--
ALTER TABLE `event_user`
  ADD CONSTRAINT `event_user_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `event_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `team_techno`
--
ALTER TABLE `team_techno`
  ADD CONSTRAINT `team_techno_ibfk_1` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `team_techno_ibfk_2` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`);

--
-- Constraints for table `user_team`
--
ALTER TABLE `user_team`
  ADD CONSTRAINT `user_team_ibfk_3` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`),
  ADD CONSTRAINT `user_team_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_team_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`);

--
-- Constraints for table `user_techno`
--
ALTER TABLE `user_techno`
  ADD CONSTRAINT `user_techno_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_techno_ibfk_2` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
