-- phpMyAdmin SQL Dump
-- version 4.1.9
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 25, 2014 at 01:44 PM
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
  `type` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_ibfk_1` (`team_id`),
  KEY `event_ibfk_2` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `type`, `user_id`, `title`, `content`, `created_on`, `team_id`) VALUES
(75, '', 15, '', 'yolo', '2014-05-25 09:17:19', 3),
(76, '', 15, '', 'bim', '2014-05-25 09:18:17', 3),
(77, '', 15, '', 'yolo', '2014-05-25 09:19:51', 3),
(78, '', 13, '', 'awdawdawd', '2014-05-25 09:19:57', 2),
(79, '', 26, '', 'qsdqsd', '2014-05-25 09:20:13', 6),
(80, '', 26, '', 'qsdqs', '2014-05-25 09:20:25', 6),
(81, '', 13, '', 'awdawdawd', '2014-05-25 09:22:26', 2),
(82, '', 13, '', 'awdwad', '2014-05-25 09:22:55', 2),
(83, '', 1, '', 'I really like technogardens.', '2014-05-25 09:23:30', 1),
(84, '', 2, '', 'test', '2014-05-25 09:28:06', 1),
(85, '', 2, '', 'qsfd', '2014-05-25 09:28:31', 1),
(86, '', 2, '', 'test', '2014-05-25 09:37:57', 1),
(87, '', 2, '', 'test', '2014-05-25 09:45:06', 1),
(88, '', 2, '', 'teste', '2014-05-25 09:46:02', 1),
(89, '', 2, '', 'teste', '2014-05-25 09:51:52', 1),
(90, '', 22, '', 'sdfsdljhl', '2014-05-25 09:53:31', 5),
(91, '', 22, '', 'fgdfg', '2014-05-25 10:01:19', 5),
(92, '', 5, '', 'Who loves docker? We think its awesome.', '2014-05-25 10:08:19', 1),
(93, '', 22, '', 'gfgfgg', '2014-05-25 10:11:08', 5),
(94, '', 2, '', 'sdf', '2014-05-25 10:21:02', 1),
(95, '', 2, '', 'teste', '2014-05-25 10:22:15', 1),
(96, '', 6, '', 'jhbhjb', '2014-05-25 11:00:27', 1);

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

--
-- Dumping data for table `event_techno`
--

INSERT INTO `event_techno` (`id_event`, `id_techno`, `created_on`) VALUES
(75, 1, '2014-05-25 09:17:19'),
(76, 3, '2014-05-25 09:18:17'),
(77, 1, '2014-05-25 09:19:51'),
(78, 3, '2014-05-25 09:19:57'),
(79, 1, '2014-05-25 09:20:13'),
(80, 3, '2014-05-25 09:20:25'),
(81, 3, '2014-05-25 09:22:26'),
(81, 6, '2014-05-25 09:22:26'),
(81, 7, '2014-05-25 09:22:26'),
(82, 1, '2014-05-25 09:22:55'),
(82, 3, '2014-05-25 09:22:55'),
(82, 8, '2014-05-25 09:22:55'),
(84, 1, '2014-05-25 09:28:06'),
(84, 6, '2014-05-25 09:28:06'),
(85, 1, '2014-05-25 09:28:31'),
(86, 1, '2014-05-25 09:37:57'),
(86, 3, '2014-05-25 09:37:57'),
(87, 1, '2014-05-25 09:45:06'),
(87, 3, '2014-05-25 09:45:06'),
(88, 1, '2014-05-25 09:46:02'),
(88, 3, '2014-05-25 09:46:02'),
(89, 1, '2014-05-25 09:51:52'),
(89, 3, '2014-05-25 09:51:52'),
(90, 1, '2014-05-25 09:53:31'),
(90, 3, '2014-05-25 09:53:31'),
(91, 6, '2014-05-25 10:01:19'),
(92, 109, '2014-05-25 10:08:19'),
(93, 1, '2014-05-25 10:11:08'),
(93, 6, '2014-05-25 10:11:08'),
(94, 1, '2014-05-25 10:21:02'),
(95, 1, '2014-05-25 10:22:15'),
(95, 3, '2014-05-25 10:22:15'),
(96, 1, '2014-05-25 11:00:27'),
(96, 3, '2014-05-25 11:00:27'),
(96, 4, '2014-05-25 11:00:27');

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
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `summary`, `location`, `tel`, `email`, `img_url`) VALUES
(1, 'BSC-CSI-Techno Garden', 'An awesome techno garden', 'paris', NULL, NULL, NULL),
(2, 'GBIS-SEC-ZPP-WIP', 'Work In Progress', 'Paris', NULL, NULL, NULL),
(3, 'GBIS-COT-Noblabla', '', 'Paris', NULL, NULL, NULL),
(4, 'BSC-AFD-Aptenodytes', 'kjsdlkajsdlmkfjs', 'Paris', NULL, NULL, NULL),
(5, 'GBIS-DAG-HUBBLE', '', 'Paris', NULL, NULL, NULL),
(6, 'GTS-DDF-BUBBLE', '', 'Paris', NULL, NULL, NULL),
(7, 'SG-KGR-CODSHAFU', 'jeu dev pour gagner il faut modifier le code des cases du damier ', '', NULL, NULL, 'http://twitpic.com/e4mpci');

-- --------------------------------------------------------

--
-- Stand-in structure for view `team_common_technos`
--
CREATE TABLE IF NOT EXISTS `team_common_technos` (
`id_team1` int(11)
,`id_team2` int(11)
,`common_technos` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `team_distance`
--
CREATE TABLE IF NOT EXISTS `team_distance` (
`id_team1` int(11)
,`id_team2` int(11)
,`common_technos` bigint(21)
,`different_technos` bigint(24)
);
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
(1, 93, '2014-05-25 08:41:01', 4),
(1, 94, '2014-05-25 09:33:50', NULL),
(1, 102, '2014-05-25 07:52:45', NULL),
(1, 103, '2014-05-24 14:34:44', NULL),
(1, 104, '2014-05-25 07:54:56', NULL),
(1, 105, '2014-05-25 07:55:05', NULL),
(1, 109, '2014-05-25 08:00:23', NULL),
(2, 1, '2014-05-24 14:34:44', NULL),
(2, 3, '2014-05-24 14:34:44', NULL),
(2, 4, '2014-05-24 14:34:44', NULL),
(2, 5, '2014-05-24 14:34:44', NULL),
(2, 6, '2014-05-24 14:34:44', NULL),
(3, 7, '2014-05-24 14:34:44', NULL),
(3, 8, '2014-05-24 14:34:44', NULL),
(3, 102, '2014-05-25 07:52:52', NULL),
(4, 7, '2014-05-24 14:34:44', NULL),
(4, 9, '2014-05-24 14:34:44', NULL),
(4, 10, '2014-05-24 14:34:44', NULL),
(4, 11, '2014-05-24 14:34:44', NULL),
(4, 12, '2014-05-24 14:34:44', NULL),
(4, 105, '2014-05-25 07:55:18', NULL),
(5, 5, '2014-05-24 14:34:44', NULL),
(5, 6, '2014-05-24 14:34:44', NULL),
(5, 12, '2014-05-24 14:34:44', NULL),
(5, 13, '2014-05-24 14:34:44', NULL),
(6, 1, '2014-05-24 14:34:44', NULL),
(6, 2, '2014-05-24 14:34:44', NULL),
(6, 5, '2014-05-24 14:34:44', NULL),
(6, 14, '2014-05-24 14:34:44', NULL),
(6, 102, '2014-05-25 07:52:58', NULL),
(6, 105, '2014-05-25 07:55:12', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `team_total_technos`
--
CREATE TABLE IF NOT EXISTS `team_total_technos` (
`id_team` int(11)
,`total_technos` bigint(21)
);
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

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
(10, 'Spring', 'An open source application framework and inversion of control container for the Java platform.', 'framework', 'spring'),
(11, 'Hibernate', 'Hibernate ORM (Hibernate in short) is an object-relational mapping library for the Java language', 'library', 'hiber'),
(12, 'AngularJS', 'An open-source web application framework, that assists with creating single-page applications, one-page web applications that only require HTML, CSS, and JavaScript on the client side.', 'framework', 'ang'),
(13, 'Bootstrap', 'A collection of tools for creating websites and web applications. It contains HTML and CSS-based design templates for typography, forms, buttons, navigation and other interface components, as well as optional JavaScript extensions.', 'framework', 'boot'),
(14, '3dJS', 'A 3D JavaScript library', 'library', '3djs'),
(15, 'Drupal', 'A content management platform ', 'platform', 'drupal'),
(16, 'C', '', 'language', 'c'),
(56, 'Objective-C', '', 'language', 'objc'),
(57, 'C++', '', 'language', 'cpp'),
(58, 'Visual Basic', '', 'language', 'visualbas'),
(59, 'C#', '', 'language', 'c#'),
(91, 'Python', '', 'language', 'python'),
(92, 'Perl', '', 'language', 'perl'),
(93, 'Ruby', '', 'language', 'ruby'),
(94, 'F#', '', 'language', 'f#'),
(95, 'TransactSQL', '', 'language', 'trans'),
(96, 'Delphi', '', 'language', 'delphi'),
(97, 'Lisp', '', 'language', 'lisp'),
(98, 'Assembly', '', 'language', 'assembly'),
(99, 'Pascal', '', 'language', 'pascal'),
(100, 'MATLAB', '', 'language', 'matlab'),
(101, 'ActionScript', '', 'language', 'action'),
(102, 'Methode agile', 'Methode agile', 'methode', 'agile'),
(103, 'symfony', 'Framework Symfony PHP', 'framework', 'symfony'),
(104, 'kibana', 'kibana', 'tools', 'kibana'),
(105, 'api', 'API REST', 'technique', 'api'),
(106, 'jenkins', 'Integration continue	', 'tools', 'jenkins'),
(107, 'debian', 'Systeme d''exploitation linux', 'os', 'debian'),
(108, 'windows', 'Systemes d''exploitation de microsoft', 'os', 'windows'),
(109, 'docker', 'docker containerisation', 'infra', 'docker');

-- --------------------------------------------------------

--
-- Table structure for table `techno_techno`
--

CREATE TABLE IF NOT EXISTS `techno_techno` (
  `name_techno1` varchar(255) NOT NULL,
  `name_techno2` varchar(255) NOT NULL,
  PRIMARY KEY (`name_techno1`,`name_techno2`),
  KEY `techno_techno_ibfk_2` (`name_techno2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `techno_techno`
--

INSERT INTO `techno_techno` (`name_techno1`, `name_techno2`) VALUES
('js', 'ang'),
('boot', 'css'),
('html', 'css'),
('php', 'drupal'),
('spring', 'j2ee'),
('j2ee', 'java'),
('spring', 'java'),
('js', 'jquery'),
('3djs', 'js');

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
  `tel` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `twittername` varchar(255) DEFAULT NULL,
  `id_team` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `IMusernme`, `teamname`, `username`, `tel`, `description`, `twittername`, `id_team`) VALUES
(1, 'Florence', 'BECK', 'fbeck@student.42.fr', 'fbeck', 'Techno Garden', 'fbeck', NULL, 'an even more awesome awesome description', NULL, 1),
(2, 'Valere', 'JEANTET', 'valere.jeantet@gmail.com', 'vjeantet', 'Techno Garden', 'vjeantet', NULL, '', NULL, 1),
(3, 'Meriadec', 'PILLET', 'mpillet@student.42.fr', 'mpillet', 'Techno Garden', 'mpillet', NULL, 'an also awesome description', NULL, 1),
(4, 'Jasmin', 'ANTEUNIS', 'janteuni@student.42.fr', 'janteuni', 'Techno Garden', 'janteuni', NULL, '', NULL, 1),
(5, 'Balthazar', 'GRONON', 'bgronon@student.42.fr', 'bgronon', 'Techno Garden', 'bgronon', NULL, '', NULL, 1),
(6, 'Thomas', 'GUILLIER', 'thomas.guillier@gmail.com', 'tguillier', 'Techno Garden', 'tguillier', NULL, '', NULL, 1),
(7, 'JB', 'INGOLD', 'ingold.jb@gmail.com', 'jbingold', 'Techno Garden', 'jbingold', NULL, '', NULL, 1),
(8, 'Melodie', 'SAGODIRA', 'msagodir@studet.42.fr', 'msagodir', 'WIP', 'msagodir', NULL, '', NULL, 2),
(9, 'Remi', 'BRIEUC', 'rbrieuc@student.42.fr', 'rbrieuc', 'WIP', 'rbrieuc', NULL, '', NULL, 2),
(10, 'Yann', 'PRINGAULT', 'ypringau@student.42.fr', 'ypringau', 'WIP', 'ypringau', NULL, '', NULL, 2),
(13, 'Hugo', 'MASSING', 'hmassing@student.42.fr', 'hmassing', 'WIP', 'hmassing', NULL, '', NULL, 2),
(14, 'Adrien', 'AUER', 'aaeur@student.42.fr', 'aaeur', 'WIP', 'aaeur', NULL, '', NULL, 2),
(15, 'Pierre', '', 'pierre@mail.fr', 'pierre', 'Noblabla', 'pierre', NULL, '', NULL, 3),
(16, 'Kevin', '', 'kevin@mail.fr', 'kevin', 'Noblabla', 'kevin', NULL, '', NULL, 3),
(17, 'Ahmed', '', 'ahmed@mail.fr', 'ahmed', 'Noblabla', 'ahmed', NULL, '', NULL, 3),
(18, 'Jeremy', 'Drouet', 'jdrouet@mail.fr', 'jdrouet', 'Aptenodytes', 'jdrouet', NULL, '', NULL, 4),
(19, 'Yann', 'Bonsens', 'ybonsens@mail.fr', 'ybonsens', 'Aptenodytes', 'ybonsens', NULL, '', NULL, 4),
(20, 'Marie', '', 'marie@mail.fr', 'marie', 'Hubble', 'marie', NULL, '', NULL, 5),
(21, 'Brice', '', 'brice@mail.fr', 'brice', 'Hubble', 'brice', NULL, '', NULL, 5),
(22, 'Fabien', '', 'fabien@mail.fr', 'fabien', 'Hubble', 'fabien', NULL, '', NULL, 5),
(23, 'Waiki', '', 'waiki@mail.fr', 'waiki', 'Hubble', 'waiki', NULL, '', NULL, 5),
(24, 'Selim', '', 'sbenhabb@student.42.fr', 'sbenhabb', 'Bubble', 'sbenhabb', NULL, '', NULL, 6),
(25, 'Fernand', '', 'fernand@mail.fr', 'fernand', 'Bubble', 'fernand', NULL, '', NULL, 6),
(26, 'Andre', '', 'andre@mail.fr', 'andre', 'Bubble', 'andre', NULL, '', NULL, 6),
(27, 'Corentin', '', 'corentin@mail.fr', 'corentin', 'Bubble', 'corentin', NULL, '', NULL, 6);

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

-- --------------------------------------------------------

--
-- Structure for view `team_common_technos`
--
DROP TABLE IF EXISTS `team_common_technos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`technogarden`@`%` SQL SECURITY DEFINER VIEW `team_common_technos` AS select `t1`.`id` AS `id_team1`,`t2`.`id` AS `id_team2`,count(distinct `te`.`id`) AS `common_technos` from ((((`teams` `t1` join `team_techno` `tt1` on((`tt1`.`id_team` = `t1`.`id`))) join `techno` `te` on((`te`.`id` = `tt1`.`id_techno`))) join `team_techno` `tt2` on((`tt2`.`id_techno` = `te`.`id`))) join `teams` `t2` on(((`t2`.`id` = `tt2`.`id_team`) and (`tt2`.`id_team` <> `tt1`.`id_team`)))) group by `t1`.`id`,`t2`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `team_distance`
--
DROP TABLE IF EXISTS `team_distance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`technogarden`@`%` SQL SECURITY DEFINER VIEW `team_distance` AS select `ct`.`id_team1` AS `id_team1`,`ct`.`id_team2` AS `id_team2`,`ct`.`common_technos` AS `common_technos`,(((`tt1`.`total_technos` - `ct`.`common_technos`) + `tt2`.`total_technos`) - `ct`.`common_technos`) AS `different_technos` from ((`team_common_technos` `ct` join `team_total_technos` `tt1` on((`tt1`.`id_team` = `ct`.`id_team1`))) join `team_total_technos` `tt2` on((`tt2`.`id_team` = `ct`.`id_team2`)));

-- --------------------------------------------------------

--
-- Structure for view `team_total_technos`
--
DROP TABLE IF EXISTS `team_total_technos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`technogarden`@`%` SQL SECURITY DEFINER VIEW `team_total_technos` AS select `tt`.`id_team` AS `id_team`,count(distinct `tt`.`id_techno`) AS `total_technos` from `team_techno` `tt` group by `tt`.`id_team`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `event_team`
--
ALTER TABLE `event_team`
  ADD CONSTRAINT `event_team_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `event_team_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`);

--
-- Constraints for table `event_techno`
--
ALTER TABLE `event_techno`
  ADD CONSTRAINT `event_techno_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `event_techno_ibfk_2` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`);

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
-- Constraints for table `techno_techno`
--
ALTER TABLE `techno_techno`
  ADD CONSTRAINT `techno_techno_ibfk_1` FOREIGN KEY (`name_techno1`) REFERENCES `techno` (`code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `techno_techno_ibfk_2` FOREIGN KEY (`name_techno2`) REFERENCES `techno` (`code`) ON UPDATE CASCADE;

--
-- Constraints for table `user_team`
--
ALTER TABLE `user_team`
  ADD CONSTRAINT `user_team_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_team_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `user_team_ibfk_3` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`);

--
-- Constraints for table `user_techno`
--
ALTER TABLE `user_techno`
  ADD CONSTRAINT `user_techno_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_techno_ibfk_2` FOREIGN KEY (`id_techno`) REFERENCES `techno` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
