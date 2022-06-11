-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2022 at 07:09 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veri_tabanı_proje_deneme`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_home_name` (IN `var1` VARCHAR(50))  BEGIN
SELECT * FROM `show_fikstür` WHERE home_name=var1 or away_name=var1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `league_id` int(11) NOT NULL,
  `league_name` varchar(30) NOT NULL,
  `reward` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`league_id`, `league_name`, `reward`) VALUES
(1, 'Serie a', '500000'),
(2, 'Super League', '500000'),
(3, 'La liga', '1000000');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `match_id` int(11) NOT NULL,
  `home_id` int(11) NOT NULL,
  `away_id` int(11) NOT NULL,
  `match_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`match_id`, `home_id`, `away_id`, `match_date`) VALUES
(1, 1, 2, '2018-11-03 16:30:00'),
(2, 3, 4, '2018-11-03 18:00:00'),
(3, 5, 6, '2018-11-03 20:30:00'),
(4, 7, 8, '2018-11-04 16:30:00'),
(5, 9, 10, '2018-11-04 18:00:00'),
(6, 11, 12, '2018-11-04 20:30:00'),
(7, 2, 4, '2018-11-10 16:30:00'),
(8, 3, 1, '2018-11-10 18:00:00'),
(9, 6, 8, '2018-11-10 20:30:00'),
(10, 7, 5, '2018-11-11 16:30:00'),
(11, 10, 12, '2018-11-11 18:00:00'),
(12, 11, 9, '2018-11-11 20:30:00'),
(13, 4, 1, '2018-11-17 16:30:00'),
(14, 2, 3, '2018-11-17 18:00:00'),
(15, 8, 5, '2018-11-17 20:30:00'),
(16, 6, 7, '2018-11-18 16:30:00'),
(17, 12, 9, '2018-11-18 18:00:00'),
(18, 10, 11, '2018-11-18 20:30:00'),
(19, 1, 6, '2018-11-24 16:30:00'),
(20, 4, 11, '2018-11-24 18:00:00'),
(21, 5, 10, '2018-11-24 20:30:00'),
(22, 8, 3, '2018-11-25 16:30:00'),
(23, 9, 7, '2018-11-25 18:00:00'),
(24, 12, 2, '2018-11-25 20:30:00');

--
-- Triggers `matches`
--
DELIMITER $$
CREATE TRIGGER `add_result` AFTER INSERT ON `matches` FOR EACH ROW INSERT INTO `results`(`match_id`, `home`, `away`) VALUES (NEW.match_id,0,0)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `position` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `team_id`, `first_name`, `last_name`, `age`, `position`, `country`) VALUES
(1, 1, 'Fredrik', 'Ivaansson', 21, 'Goalkeeper', 'Sweden'),
(2, 1, 'Marcus', 'White-Dansson', 22, 'Defender', 'Scotland'),
(3, 1, 'Matias', 'Ismisson', 77, 'Defender', 'Sweden'),
(4, 1, 'Kalle', 'Kroll', 8, 'Defender', 'Finland'),
(5, 1, 'Rune', 'Shermany', 14, 'Defender', 'Iceland'),
(6, 1, 'Sven', 'Havensson', 6, 'Defender', 'Norway'),
(7, 1, 'Petr', 'Groshkov', 60, 'Midfielder', 'Russia'),
(8, 1, 'Lars', 'Jaaskalainen', 15, 'Midfielder', 'Finland'),
(9, 1, 'Piter', 'Flash', 3, 'Midfielder', 'Scotland'),
(10, 1, 'Max', 'Twister', 18, 'Forward', 'England'),
(11, 1, 'Oliver', 'Fox', 24, 'Forward', 'England'),
(12, 2, 'Anders', 'Valdez', 33, 'Goalkeeper', 'Paraguay'),
(13, 2, 'Romanos', 'Ravar', 13, 'Defender', 'Argentina'),
(14, 2, 'Lopez', 'Annabe', 2, 'Defender', 'Mexico'),
(15, 2, 'Fabio', 'Ariel', 3, 'Defender', 'Argentina'),
(16, 2, 'Roque', 'Riveros', 5, 'Defender', 'Paraguay'),
(17, 2, 'Xivinho', 'Torres', 7, 'Midfielder', 'Brazil'),
(18, 2, 'Karim', 'Khariri', 19, 'Midfielder', 'Lebanon'),
(19, 2, 'Rustu', 'Bruker', 27, 'Midfielder', 'Turkey'),
(20, 2, 'Ali', 'Jakaloah', 26, 'Midfielder', 'Qatar'),
(21, 2, 'Robert', 'Wiik', 30, 'Midfielder', 'Netherlands'),
(22, 2, 'Pascal', 'Rafael', 17, 'Forward', 'Netherlands'),
(23, 3, 'Jens', 'Zwaanswijk', 1, 'Goalkeeper', 'Netherlands'),
(24, 3, 'Xavier', 'van Vaquer', 2, 'Defender', 'Netherlands'),
(25, 3, 'Mattias', 'van der Schaaf', 3, 'Defender', 'Netherlands'),
(26, 3, 'Eaat', 'van Dessert', 4, 'Defender', 'Netherlands'),
(27, 3, 'Olaf', 'Neigel-Forsell', 5, 'Defender', 'England'),
(28, 3, 'Pascal', 'Geneve', 6, 'Defender', 'Australia'),
(29, 3, 'William', 'Gimirre', 7, 'Midfielder', 'France'),
(30, 3, 'Roger', 'Figeneger', 8, 'Midfielder', 'Germany'),
(31, 3, 'Oliver', 'Raisenmann', 9, 'Midfielder', 'Germany'),
(32, 3, 'Hazel', 'Dexter', 10, 'Midfielder', 'Germany'),
(33, 3, 'Michael', 'Konah', 11, 'Forward', 'Germany'),
(34, 4, 'Patrick', 'Havhalon', 14, 'Goalkeeper', 'France'),
(35, 4, 'Jurgen', 'Connor', 2, 'Defender', 'Belgium'),
(36, 4, 'Pablo', 'Lucke', 5, 'Defender', 'Lichtenstein'),
(37, 4, 'Daniel', 'Otto', 3, 'Defender', 'Australia'),
(38, 4, 'Marini', 'Feloni', 6, 'Midfielder', 'Italy'),
(39, 4, 'Thomas', 'Canaveri', 13, 'Midfielder', 'Italy'),
(40, 4, 'Omar', 'McSir', 31, 'Midfielder', 'Wales'),
(41, 4, 'Samuel', 'Marakua', 9, 'Midfielder', 'Cameroon'),
(42, 4, 'Javier', 'Pivil', 10, 'Midfielder', 'Argentina'),
(43, 4, 'Carles', 'Fernando', 8, 'Forward', 'Spain'),
(44, 4, 'Santos', 'Squezze', 21, 'Forward', 'Brazil'),
(45, 5, 'Victor', 'Maestro', 1, 'Goalkeeper', 'Italy'),
(46, 5, 'Torres', 'Kataldo', 12, 'Defender', 'Spain'),
(47, 5, 'Igor', 'Ftorelnik', 4, 'Defender', 'Slovakia'),
(48, 5, 'Alvaro', 'Timonte', 14, 'Defender', 'Mexico'),
(49, 5, 'Joachim', 'Quersi', 17, 'Midfielder', 'Argentina'),
(50, 5, 'Pavlodar', 'Milichenko', 6, 'Midfielder', 'Ukraine'),
(51, 5, 'Otabek', 'Ohmetov', 18, 'Midfielder', 'Uzbekistan'),
(52, 5, 'Radomir', 'Contofalsky', 16, 'Midfielder', 'Bosnia and Herzegovina'),
(53, 5, 'Igor', 'Karashevich', 26, 'Forward', 'Russia'),
(54, 5, 'Timor', 'Romanović', 19, 'Forward', 'Serbia'),
(55, 5, 'Zoran', 'Królović', 13, 'Forward', 'Croatia'),
(56, 6, 'Brian', 'Rookie', 28, 'Goalkeeper', 'USA'),
(57, 6, 'George', 'Stanley', 14, 'Defender', 'Canada'),
(58, 6, 'Usain', 'Neon', 17, 'Defender', 'Jamaica'),
(59, 6, 'Aaron', 'Obika', 2, 'Defender', 'South Africa'),
(60, 6, 'Donald', 'Moot', 6, 'Defender', 'Bahamas'),
(61, 6, 'Asafa', 'Moot', 3, 'Midfielder', 'Bahamas'),
(62, 6, 'Umbaba', 'Quakuani', 8, 'Midfielder', 'South Africa'),
(63, 6, 'Joel', 'Katakui', 21, 'Midfielder', 'Cameroon'),
(64, 6, 'Ji', 'Tae-Choi', 10, 'Midfielder', 'North Korea'),
(65, 6, 'Lee', 'Xiang-Mi', 37, 'Midfielder', 'South Korea'),
(66, 6, 'Haku', 'Neliong', 11, 'Forward', 'Japan'),
(67, 7, 'Felicjan', 'Sprężyna', 31, 'Goalkeeper', 'Poland'),
(68, 7, 'Stanisław', 'Piątek', 11, 'Defender', 'Poland'),
(69, 7, 'Marek', 'Wojciechowski', 4, 'Defender', 'Poland'),
(70, 7, 'Piotr', 'Piątek', 12, 'Defender', 'Poland'),
(71, 7, 'Stefan', 'Ochola', 6, 'Defender', 'Slovakia'),
(72, 7, 'Sandor', 'Hosok', 13, 'Midfielder', 'Hungary'),
(73, 7, 'Filip', 'Mazowiecki', 10, 'Midfielder', 'Poland'),
(74, 7, 'Łukasz', 'Dyniarski', 8, 'Midfielder', 'Poland'),
(75, 7, 'Adam', 'Warcholek', 7, 'Midfielder', 'Czech Republic'),
(76, 7, 'Piotr', 'Siwobrody', 9, 'Forward', 'Poland'),
(77, 7, 'Wojciech', 'Krauze', 16, 'Forward', 'Poland'),
(78, 8, 'Ma', 'Peng', 1, 'Goalkeeper', 'China'),
(79, 8, 'John', 'Spiker', 7, 'Defender', 'New Zeland'),
(80, 8, 'Kim', 'Chol-Guk', 3, 'Defender', 'South Korea'),
(81, 8, 'Ahito', 'Akubo', 15, 'Defender', 'Japan'),
(82, 8, 'Lee', 'Zang', 6, 'Defender', 'China'),
(83, 8, 'Tony', 'Juaba', 9, 'Midfielder', 'South Africa'),
(84, 8, 'Viktor', 'Sohovenko', 17, 'Midfielder', 'Ukraine'),
(85, 8, 'Viktoras', 'Marciulaitis', 14, 'Midfielder', 'Lithuania'),
(86, 8, 'George', 'Brown', 8, 'Midfielder', 'England'),
(87, 8, 'Oscar', 'Stewart', 22, 'Forward', 'Scotland'),
(88, 8, 'Luke', 'Brown', 36, 'Forward', 'England'),
(89, 9, 'Kostakis', 'Papadopoulos', 17, 'Goalkeeper', 'Greece'),
(90, 9, 'Makarios', 'Avraamidis', 2, 'Defender', 'Cyprus'),
(91, 9, 'Nektarios', 'Kastanos', 3, 'Defender', 'Cyprus'),
(92, 9, 'Marko', 'Volkov', 16, 'Defender', 'Montenegro'),
(93, 9, 'Aleksandar', 'Stojković', 25, 'Defender', 'Croatia'),
(94, 9, 'Nebojsa', 'Janković', 6, 'Defender', 'Serbia'),
(95, 9, 'Karl', 'Lepistu', 29, 'Midfielder', 'Estonia'),
(96, 9, 'Nikita', 'Subbotin', 19, 'Midfielder', 'Latvia'),
(97, 9, 'Mattias', 'Liivak', 4, 'Midfielder', 'Lithuania'),
(98, 9, 'Stavros', 'Alexandrou', 10, 'Forward', 'Greece'),
(99, 9, 'Ioannis', 'Kyriakou', 7, 'Forward', 'Cyprus'),
(100, 10, 'Stefanos', 'Nikolaidis', 44, 'Goalkeeper', 'Greece'),
(101, 10, 'Petristis', 'Apostolakis', 2, 'Defender', 'Cyprus'),
(102, 10, 'Augustus', 'Verpakovsis', 4, 'Defender', 'Lithuania'),
(103, 10, 'Bert', 'Hooghe', 3, 'Defender', 'Luksemburg'),
(104, 10, 'Maarten', 'Schreijer', 5, 'Defender', 'Netherlands'),
(105, 10, 'Jesse', 'Jansen', 6, 'Defender', 'Germany'),
(106, 10, 'Finn', 'Kuijpers', 16, 'Midfielder', 'Dania'),
(107, 10, 'Bram', 'Nijevelt', 26, 'Midfielder', 'Netherlands'),
(108, 10, 'Johan', 'Schaake', 14, 'Midfielder', 'Germany'),
(109, 10, 'Angelos', 'Glykos', 36, 'Midfielder', 'Cyprus'),
(110, 10, 'Kyriakos', 'Petropoulos', 17, 'Forward', 'Greece'),
(111, 11, 'Tim', 'Aschenbrenner', 99, 'Goalkeeper', 'Germany'),
(112, 11, 'Christian', 'Schrodinger', 25, 'Defender', 'Austria'),
(113, 11, 'Simon', 'Drache', 28, 'Defender', 'Germany'),
(114, 11, 'Georg', 'Schlessinger', 2, 'Defender', 'Austria'),
(115, 11, 'Uwe', 'Zimmermann', 27, 'Defender', 'Belgium'),
(116, 11, 'Detlef', 'Waxman', 14, 'Midfielder', 'Germany'),
(117, 11, 'Włodzimierz', 'Sobieraj', 13, 'Midfielder', 'Poland'),
(118, 11, 'Maciej', 'Koniecpolski', 18, 'Midfielder', 'Poland'),
(119, 11, 'Jan', 'Zaśniegóra', 9, 'Forward', 'Poland'),
(120, 11, 'Paweł', 'Chapko', 34, 'Forward', 'Poland'),
(121, 11, 'Andrij', 'Berezowchuk', 3, 'Forward', 'Belarus'),
(122, 12, 'Przemysław', 'Piekoś', 12, 'Goalkeeper', 'Poland'),
(123, 12, 'Michał', 'Batory', 16, 'Defender', 'Poland'),
(124, 12, 'Noah', 'Bishop', 15, 'Defender', 'USA'),
(125, 12, 'Marco', 'Nucci', 19, 'Defender', 'Italy'),
(126, 12, 'Beniamino', 'Lucciano', 18, 'Defender', 'Italy'),
(127, 12, 'Livio', 'Fanucci', 7, 'Midfielder', 'Italy'),
(128, 12, 'Russell', 'Lewis', 6, 'Midfielder', 'Canada'),
(129, 12, 'Ruslan', 'Hladky', 21, 'Midfielder', 'Belarus'),
(130, 12, 'Piotr', 'Przybyło', 27, 'Forward', 'Poland'),
(131, 12, 'Nikolay', 'Kirilov', 28, 'Forward', 'Russia'),
(132, 12, 'Petr', 'Stavorogin', 41, 'Forward', 'Russia');

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_informations`
-- (See below for the actual view)
--
CREATE TABLE `player_informations` (
`team_name` varchar(30)
,`first_name` varchar(30)
,`last_name` varchar(30)
,`age` int(11)
,`position` varchar(30)
,`country` varchar(30)
,`goal` decimal(32,0)
,`asist` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `match_id` int(11) NOT NULL,
  `home` int(11) NOT NULL,
  `away` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`match_id`, `home`, `away`) VALUES
(1, 4, 1),
(2, 1, 2),
(3, 1, 1),
(4, 3, 3),
(5, 2, 0),
(6, 1, 1),
(7, 2, 0),
(8, 0, 3),
(9, 0, 3),
(10, 4, 0),
(11, 1, 1),
(12, 2, 2),
(13, 0, 3),
(14, 2, 0),
(15, 3, 1),
(16, 0, 5),
(17, 0, 0),
(18, 0, 1),
(19, 3, 0),
(20, 0, 2),
(21, 0, 0),
(22, 3, 0),
(23, 5, 2),
(24, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `score_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `goals` int(11) NOT NULL,
  `assists` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`score_id`, `match_id`, `team_id`, `player_id`, `goals`, `assists`) VALUES
(1, 1, 1, 7, 0, 1),
(2, 1, 1, 9, 1, 2),
(3, 1, 1, 10, 1, 0),
(4, 1, 1, 11, 2, 1),
(5, 1, 2, 18, 0, 1),
(6, 1, 2, 22, 1, 0),
(7, 2, 3, 31, 0, 1),
(8, 2, 3, 33, 1, 0),
(9, 2, 4, 40, 0, 1),
(10, 2, 4, 41, 0, 1),
(11, 2, 4, 43, 1, 0),
(12, 2, 4, 44, 1, 0),
(13, 3, 5, 50, 0, 1),
(14, 3, 5, 55, 1, 0),
(15, 3, 6, 61, 0, 1),
(16, 3, 6, 66, 1, 0),
(17, 4, 7, 74, 0, 1),
(18, 4, 7, 75, 0, 1),
(19, 4, 7, 76, 1, 1),
(20, 4, 7, 77, 2, 0),
(21, 4, 8, 82, 0, 1),
(22, 4, 8, 84, 0, 1),
(23, 4, 8, 85, 0, 1),
(24, 4, 8, 86, 1, 0),
(25, 4, 8, 87, 1, 0),
(26, 4, 8, 88, 1, 0),
(27, 5, 9, 96, 0, 1),
(28, 5, 9, 97, 0, 1),
(29, 5, 9, 99, 2, 0),
(30, 6, 11, 118, 0, 1),
(31, 6, 11, 120, 1, 0),
(32, 6, 12, 131, 1, 0),
(33, 7, 2, 18, 0, 1),
(34, 7, 2, 19, 0, 1),
(35, 7, 2, 22, 2, 0),
(36, 8, 1, 6, 0, 1),
(37, 8, 1, 7, 0, 2),
(38, 8, 1, 9, 1, 0),
(39, 8, 1, 10, 1, 0),
(40, 8, 1, 11, 1, 0),
(41, 9, 8, 85, 0, 1),
(42, 9, 8, 86, 1, 1),
(43, 9, 8, 87, 2, 1),
(44, 10, 7, 74, 0, 2),
(45, 10, 7, 75, 0, 1),
(46, 10, 7, 76, 2, 1),
(47, 10, 7, 77, 2, 0),
(48, 11, 10, 109, 1, 0),
(49, 11, 10, 110, 0, 1),
(50, 11, 12, 132, 1, 0),
(51, 12, 11, 119, 1, 0),
(52, 12, 11, 120, 0, 2),
(53, 12, 11, 121, 1, 0),
(54, 12, 9, 96, 0, 2),
(55, 12, 9, 97, 1, 0),
(56, 12, 9, 99, 1, 0),
(57, 13, 1, 7, 0, 1),
(58, 13, 1, 8, 0, 1),
(59, 13, 1, 9, 0, 1),
(60, 13, 1, 10, 3, 0),
(61, 14, 2, 19, 0, 1),
(62, 14, 2, 20, 1, 0),
(63, 14, 2, 21, 0, 1),
(64, 14, 2, 22, 1, 0),
(65, 15, 5, 19, 1, 0),
(66, 15, 8, 83, 0, 1),
(67, 15, 8, 84, 0, 1),
(68, 15, 8, 85, 1, 0),
(69, 15, 8, 87, 1, 1),
(70, 15, 8, 88, 1, 0),
(71, 16, 7, 70, 0, 1),
(72, 16, 7, 72, 0, 1),
(73, 16, 7, 73, 0, 1),
(74, 16, 7, 75, 1, 0),
(75, 16, 7, 76, 1, 1),
(76, 16, 7, 77, 3, 1),
(77, 18, 11, 121, 1, 0),
(78, 19, 1, 8, 0, 1),
(79, 19, 1, 9, 1, 1),
(80, 19, 1, 10, 1, 1),
(81, 19, 1, 11, 1, 0),
(82, 20, 11, 117, 0, 1),
(83, 20, 11, 119, 0, 1),
(84, 20, 11, 120, 1, 0),
(85, 20, 11, 121, 1, 0),
(86, 22, 8, 85, 0, 1),
(87, 22, 8, 86, 0, 1),
(88, 22, 8, 87, 2, 0),
(89, 22, 8, 88, 1, 1),
(90, 23, 7, 75, 0, 1),
(91, 23, 7, 76, 0, 1),
(92, 23, 7, 77, 2, 0),
(93, 23, 9, 95, 1, 1),
(94, 23, 9, 96, 1, 1),
(95, 23, 9, 97, 1, 1),
(96, 23, 9, 98, 1, 0),
(97, 23, 9, 99, 1, 1),
(98, 24, 2, 22, 1, 0);

--
-- Triggers `scores`
--
DELIMITER $$
CREATE TRIGGER `update_result` AFTER INSERT ON `scores` FOR EACH ROW BEGIN
UPDATE results 
LEFT JOIN scores ON NEW.match_id=results.match_id
LEFT JOIN matches ON matches.match_id=results.match_id
SET home=if(NEW.team_id = matches.home_id,(SELECT home from results WHERE results.match_id = NEW.match_id)+NEW.goals,home),
away=if(NEW.team_id = matches.away_id,(SELECT away from results WHERE results.match_id = NEW.match_id)+NEW.goals,away)
WHERE results.match_id = NEW.match_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `show_fikstür`
-- (See below for the actual view)
--
CREATE TABLE `show_fikstür` (
`home_name` varchar(30)
,`away_name` varchar(30)
,`match_date` datetime
,`home_skor` int(11)
,`away_skor` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `team_name` varchar(30) NOT NULL,
  `shorhand` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `league_id`, `team_name`, `shorhand`) VALUES
(1, 1, 'AC Milan', 'ACM'),
(2, 1, 'FC Barcelona', 'FCB'),
(3, 1, 'Borussia Dortmund', 'BOR'),
(4, 1, 'Lyon', 'LYO'),
(5, 2, 'BATE Borisov', 'BAT'),
(6, 2, 'Schalke 04', 'SCH'),
(7, 2, 'Wisła Cracow', 'WIS'),
(8, 2, 'Paris Saint-Germain', 'PSG'),
(9, 3, 'Juventus', 'JUV'),
(10, 3, 'Ajax Amsterdam', 'RES'),
(11, 3, 'Legia Warsaw', 'LEG'),
(12, 3, 'Spartak Moscow', 'SPA');

-- --------------------------------------------------------

--
-- Structure for view `player_informations`
--
DROP TABLE IF EXISTS `player_informations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_informations`  AS SELECT `teams`.`team_name` AS `team_name`, `players`.`first_name` AS `first_name`, `players`.`last_name` AS `last_name`, `players`.`age` AS `age`, `players`.`position` AS `position`, `players`.`country` AS `country`, coalesce(sum(`scores`.`goals`),0) AS `goal`, coalesce(sum(`scores`.`assists`),0) AS `asist` FROM ((`players` left join `teams` on(`players`.`team_id` = `teams`.`team_id`)) left join `scores` on(`players`.`player_id` = `scores`.`player_id`)) GROUP BY `players`.`player_id` ;

-- --------------------------------------------------------

--
-- Structure for view `show_fikstür`
--
DROP TABLE IF EXISTS `show_fikstür`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `show_fikstür`  AS SELECT `t1`.`team_name` AS `home_name`, `t2`.`team_name` AS `away_name`, `matches`.`match_date` AS `match_date`, `results`.`home` AS `home_skor`, `results`.`away` AS `away_skor` FROM (((`matches` join `teams` `t1` on(`matches`.`home_id` = `t1`.`team_id`)) join `teams` `t2` on(`matches`.`away_id` = `t2`.`team_id`)) left join `results` on(`matches`.`match_id` = `results`.`match_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`league_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `home_id` (`home_id`),
  ADD KEY `away_id` (`away_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`match_id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`score_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `league_id` (`league_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `league`
--
ALTER TABLE `league`
  MODIFY `league_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`home_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`away_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scores_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `league` (`league_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
