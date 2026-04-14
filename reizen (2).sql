-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 02 dec 2020 om 14:21
-- Serverversie: 10.4.6-MariaDB
-- PHP-versie: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reizen`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestemming`
--

CREATE TABLE `bestemming` (
  `idbestemming` varchar(5) NOT NULL,
  `plaats` varchar(25) DEFAULT NULL,
  `land` varchar(25) DEFAULT NULL,
  `werelddeel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `bestemming`
--

INSERT INTO `bestemming` (`idbestemming`, `plaats`, `land`, `werelddeel`) VALUES
('ALANY', 'Alanya', 'Turkije', 'West-Europa'),
('ALEXA', 'Alexandrie', 'Egypte', 'Afrika'),
('ANTAL', 'Antalya', 'Turkije', 'West-Europa'),
('BAGHD', 'Baghdad', 'Irak', 'Azie'),
('BALI', 'Bali', 'Indonesie', 'Azie'),
('BANGK', 'Bangkok', 'Thailand', 'Azie'),
('BARCE', 'Barcelona', 'Spanje', 'West-Europa'),
('BASRA', 'Basra', 'Irak', 'Azie'),
('BENID', 'Benidorm', 'Spanje', 'West-Europa'),
('BOGOT', 'Bogota', 'Colombia', 'Zuid-Amerika'),
('BUENO', 'Buenos Aires', 'Argentinie', 'Zuid-Amerika'),
('CAIRO', 'Cairo', 'Egypte', 'Afrika'),
('CALGA', 'Calgary', 'Canada', 'Noord-Amerika'),
('CARAC', 'Caracas', 'Venezuela', 'Zuid-Amerika'),
('CARTA', 'Cartagena', 'Colombia', 'Zuid-Amerika'),
('CASSA', 'Cassablanca', 'Marokko', 'Afrika'),
('CHIAN', 'Chianmai', 'Thailand', 'Azie'),
('CORDO', 'Cordoba', 'Argentinie', 'Zuid-Amerika'),
('CORSI', 'Corsica', 'Frankrijk', 'West-Europa'),
('DALLA', 'Dallas', 'Verenigde Staten', 'Noord-Amerika'),
('DROME', 'Drome', 'Frankrijk', 'West-Europa'),
('DUSSD', 'Dusseldorf', 'Duitsland', 'West-Europa'),
('ELALA', 'ElAlamein', 'Egypte', 'Afrika'),
('GERON', 'Gerona', 'Spanje', 'West-Europa'),
('GITES', 'Gites', 'Frankrijk', 'West-Europa'),
('GRANC', 'Gran Canaria', 'Spanje', 'West-Europa'),
('HELSI', 'Helsinki', 'Finland', 'West-Europa'),
('ISTAN', 'Istanbul', 'Turkije', 'West-Europa'),
('JAKAR', 'Jakarta', 'Indonesie', 'Azie'),
('KIRKU', 'Kirkuk', 'Irak', 'Azie'),
('LIMA', 'Lima', 'Peru', 'Zuid-Amerika'),
('MADRI', 'Madrid', 'Spanje', 'West-Europa'),
('MANIL', 'Manila', 'Filippijnen', 'Azie'),
('MARDE', 'Mar del Plata', 'Argentinie', 'Zuid-Amerika'),
('MEDAN', 'Medan', 'Indonesie', 'Azie'),
('MEXIC', 'Mexico', 'Mexico', 'Noord-Amerika'),
('MIAMI', 'Miami', 'Verenigde Staten', 'Noord-Amerika'),
('MOIRA', 'Moirara', 'Spanje', 'West-Europa'),
('MONTE', 'Montevideo', 'Uruguay', 'Zuid-Amerika'),
('MONTR', 'Montreal', 'Canada', 'Noord-Amerika'),
('MOSUL', 'Mosul', 'Irak', 'Azie'),
('NEWOR', 'New Orleans', 'Verenigde Staten', 'Noord-Amerika'),
('OTTAW', 'Ottawa', 'Canada', 'Noord-Amerika'),
('PARIJ', 'Parijs', 'Frankrijk', 'West-Europa'),
('PATTA', 'Pattaya', 'Thailand', 'Azie'),
('RABAT', 'Rabat', 'Marokko', 'Afrika'),
('RECIF', 'Recife', 'Brazilie', 'Zuid-Amerika'),
('RIO', 'Rio de Janeiro', 'Brazilie', 'Zuid-Amerika'),
('SALOU', 'Salou', 'Spanje', 'West-Europa'),
('SANFR', 'San Francisco', 'Verenigde Staten', 'Noord-Amerika'),
('SANPA', 'San Pablo', 'Filippijnen', 'Azie'),
('SAOPA', 'Sao Paulo', 'Brazilie', 'Zuid-Amerika'),
('SURUB', 'Surubaya', 'Indonesie', 'Azie'),
('TANGE', 'Tanger', 'Marokko', 'Afrika'),
('THEBE', 'Thebes', 'Egypte', 'Afrika'),
('VERAC', 'Veracruz', 'Mexico', 'Noord-Amerika'),
('WASHI', 'Washington', 'Verenigde Staten', 'Noord-Amerika');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `boeking`
--

CREATE TABLE `boeking` (
  `idboeking` int(6) NOT NULL,
  `idklant` int(5) DEFAULT NULL,
  `idreis` int(5) DEFAULT NULL,
  `boekdatum` date DEFAULT NULL,
  `avolwassenen` int(2) DEFAULT NULL,
  `akinderen` int(2) DEFAULT NULL,
  `aanbetaling` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `boeking`
--

INSERT INTO `boeking` (`idboeking`, `idklant`, `idreis`, `boekdatum`, `avolwassenen`, `akinderen`, `aanbetaling`) VALUES
(1, 15, 7, '2019-03-23', 2, 0, '650.00'),
(2, 11, 19, '2019-03-23', 1, 0, '0.00'),
(3, 22, 17, '2019-03-23', 2, 1, '1150.00'),
(4, 5, 9, '2019-03-23', 2, 0, '0.00'),
(5, 11, 2, '2019-03-23', 1, 0, '1000.00'),
(6, 10, 16, '2019-03-24', 2, 0, '2250.00'),
(7, 8, 14, '2019-03-24', 2, 2, '0.00'),
(8, 15, 21, '2019-03-24', 1, 0, '1250.00'),
(9, 9, 22, '2019-03-25', 2, 0, '1500.00'),
(10, 10, 17, '2019-03-27', 5, 3, '2250.00'),
(11, 14, 15, '2019-03-28', 4, 5, '0.00'),
(12, 31, 10, '2019-03-29', 2, 0, '1600.00'),
(13, 2, 10, '2019-04-02', 4, 1, '2250.00'),
(14, 13, 20, '2019-04-02', 2, 0, '0.00'),
(15, 3, 8, '2019-04-03', 3, 1, '2100.00'),
(16, 7, 19, '2019-04-03', 2, 0, '0.00'),
(17, 21, 24, '2019-04-04', 2, 1, '500.00'),
(18, 18, 11, '2019-04-04', 4, 0, '0.00'),
(19, 4, 26, '2019-04-05', 2, 3, '1150.00'),
(20, 16, 28, '2019-04-05', 2, 1, '0.00'),
(21, 19, 13, '2019-04-05', 3, 1, '0.00'),
(22, 20, 21, '2019-04-06', 1, 0, '1250.00'),
(23, 17, 21, '2019-04-06', 1, 0, '1250.00'),
(24, 24, 7, '2019-05-23', 2, 0, '650.00'),
(25, 25, 19, '2019-05-23', 1, 0, '0.00'),
(26, 26, 17, '2019-05-23', 2, 1, '1150.00'),
(27, 27, 9, '2019-05-23', 2, 0, '0.00'),
(28, 28, 2, '2019-06-23', 1, 0, '1000.00'),
(29, 29, 16, '2019-06-24', 2, 0, '2250.00'),
(30, 11, 14, '2019-06-24', 2, 2, '0.00'),
(31, 31, 21, '2019-07-24', 1, 0, '1250.00'),
(32, 32, 22, '2019-07-25', 2, 0, '1500.00'),
(33, 33, 17, '2019-07-27', 5, 3, '2250.00'),
(34, 34, 15, '2019-07-28', 4, 5, '0.00'),
(35, 24, 10, '2019-08-29', 2, 0, '1600.00'),
(36, 24, 10, '2019-08-02', 4, 1, '2250.00'),
(37, 26, 20, '2019-08-02', 2, 0, '0.00'),
(38, 27, 8, '2019-08-03', 3, 1, '2100.00'),
(39, 28, 19, '2019-09-03', 2, 0, '0.00'),
(40, 29, 24, '2019-09-04', 2, 1, '500.00'),
(41, 30, 11, '2019-09-04', 4, 0, '0.00'),
(42, 34, 26, '2019-09-05', 2, 3, '1150.00'),
(43, 31, 28, '2019-09-05', 2, 1, '0.00'),
(44, 32, 13, '2019-09-05', 3, 1, '0.00'),
(45, 33, 21, '2019-09-06', 1, 0, '1250.00'),
(46, 30, 21, '2019-09-06', 1, 0, '1250.00'),
(47, 15, 26, '2019-09-05', 2, 3, '1150.00'),
(48, 4, 28, '2019-09-05', 2, 1, '0.00'),
(49, 11, 13, '2019-09-05', 3, 1, '0.00'),
(50, 18, 21, '2019-09-06', 1, 0, '1250.00'),
(51, 19, 21, '2019-09-06', 1, 0, '1250.00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `idklant` int(5) NOT NULL,
  `naam` varchar(25) DEFAULT NULL,
  `adres` varchar(25) DEFAULT NULL,
  `postcode` varchar(7) DEFAULT NULL,
  `plaats` varchar(25) DEFAULT NULL,
  `telefoon` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`idklant`, `naam`, `adres`, `postcode`, `plaats`, `telefoon`, `email`) VALUES
(1, 'Vuuren J. van', 'Bastion 5', '3221 LE', 'Hellevoetsluis', '0181317346', 'vuuren@mail.com'),
(2, 'Baggerman A.', 'Nassaustraat 141', '2983 RD', 'Ridderkerk', '0180417567', 'baggerman@mail.com'),
(3, 'Wubben P.F', 'Evenaar 68', '3067 DA', 'Rotterdam', '0104205259', 'wubben@mail.com'),
(4, 'Baggerman A.', 'Maisdreef 8', '3204 GM', 'Spijkenisse', '0181638923', NULL),
(5, 'Pieterman K.', 'De wouden 93', '9405 HC', 'Assen', '0592358938', 'pieterman@mail.com'),
(6, 'Taks F.', 'De koppele 777', '5632 LV', 'Eindhoven', '0402420368', NULL),
(7, 'Ruigrok W.', 'Pompstraat 47', '3082 RR', 'Rotterdam', '0104553694', 'ruigrok@mail.com'),
(8, 'Waardenburg P.', 'Koenraadlaan 50', '5651 EW', 'Eindhoven', '0402518367', NULL),
(9, 'Ramaker J.M.', 'Heideanjer 44', '7721 HE', 'Dalfsen', '0529438493', 'ramaker@mail.com'),
(10, 'Jansen W.A.J.', 'Delkant 4', '5311 CJ', 'Gameren', '0418563829', 'jansenwaj@mail.com'),
(11, 'Galen P. van', 'Nassaulaan 4', '3116 EV', 'Schiedam', '0104265028', 'galenvan@mail.com'),
(12, 'Brigman R.', 'Bolderwerk 5', '3134 MA', 'Vlaardingen', '0104354223', 'brigman@mail.com'),
(13, 'Pedersen J.', 'Drinkwaterweg 404', '3063 JC', 'Rotterdam', '0104182219', NULL),
(14, 'Slootweg A.', 'Platanendreef 6', '3137 CN', 'Vlaardingen', '0104730435', 'slootweg@mail.com'),
(15, 'Brugman D.', 'Edisonstraat 34 a', '3112 LW', 'Schiedam', '0104704951', 'brugman@mail.com'),
(16, 'Jansen J.', 'Prinsenlaan 393', '3067 TX', 'Rotterdam', '0104804674', 'jansenj@mail.com'),
(17, 'Diepenhorst K.C.', 'Gemeenlandsedijk 4', '3216 AG', 'Abbenbroek', '0181669241', 'diepenhorst@mail.com'),
(18, 'Antes A.J.J.', 'Merelstraat 4', '4793 HA', 'Fijnaart', '0168462236', 'antes@mail.com'),
(19, 'Jansen H.T.', 'Ankerstraat 16', '7071 WH', 'Ulft', '0315681206', NULL),
(20, 'Jansen J.', 'Buitenbrinkweg 54', '3853 LX', 'Ermelo', '0341553246', NULL),
(21, 'Stienstra W.', 'Juckemastraat 23', '8801 GL', 'Franeker', '0517395068', 'stienstra@mail.com'),
(22, 'Jaggers S.', 'Schorpioenstraat 282', '3067 KW', 'Rotterdam', '0104565551', 'jaggers@mail.com'),
(23, 'Overweg J.', 'Waterweg 40', '3063 JX', 'Rotterdam', '0104183319', NULL),
(24, 'Slootman A.', 'Greefstraat 6', '6137 CN', 'Zwolle', '0524730435', 'slootman@mail.com'),
(25, 'Bruggink D.', 'Edisonstraat 34 a', '5112 LW', 'Amersfoort', '0304704951', 'bruggink@mail.com'),
(26, 'Jacobsen K.', 'Rozenlaan 393', '5067 TX', 'Amersfoort', '0304804674', 'jacobsenj@mail.com'),
(27, 'Dankhorst K.C.', 'Zuidlandsedijk 4', '5216 AG', 'Deventer', '0534669241', 'dankhorst@mail.com'),
(28, 'Dentes A.K', 'Vinkstraat 4', '5793 HA', 'Deventer', '0538462236', 'dentes@mail.com'),
(29, 'Vervaart T.', 'Donkerstraat 16', '8071 WH', 'Tilburg', '0815681206', NULL),
(30, 'Gier de J.', 'Brinkweg 54', '9853 LX', 'Eindhoven', '0941553246', NULL),
(31, 'Steenstra W.', 'Rembrandtstraat 23', '9801 GL', 'Eindhoven', '0617395068', 'gier@mail.com'),
(32, 'Jamers S.', 'Schorsstraat 282', '9067 KW', 'Tilburg', '0614565551', 'jamers@mail.com'),
(33, 'Bovenlander W.', 'Boschstraat 23', '9822 GL', 'Breda', '0644395068', 'Bovenlander@mail.com'),
(34, 'Lamers S.', 'Bosstraat 282', '9867 KW', 'Breda', '0614577551', 'lamers@mail.com');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reis`
--

CREATE TABLE `reis` (
  `idreis` int(5) NOT NULL,
  `idbestemming` varchar(5) DEFAULT NULL,
  `vertrekdatum` date DEFAULT NULL,
  `aantaldagen` int(2) DEFAULT NULL,
  `prijsperpersoon` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `reis`
--

INSERT INTO `reis` (`idreis`, `idbestemming`, `vertrekdatum`, `aantaldagen`, `prijsperpersoon`) VALUES
(1, 'SANPA', '2017-03-12', 14, '1150.00'),
(2, 'SANFR', '2017-03-17', 14, '1600.00'),
(3, 'BALI', '2017-03-17', 21, '2150.00'),
(4, 'CORSI', '2017-03-19', 23, '800.00'),
(5, 'CORDO', '2017-04-20', 21, '2650.00'),
(6, 'MADRI', '2017-04-20', 10, '700.00'),
(7, 'SANPA', '2017-04-22', 23, '2450.00'),
(8, 'RABAT', '2017-04-24', 12, '1385.00'),
(9, 'TANGE', '2017-04-24', 23, '1825.00'),
(10, 'VERAC', '2017-05-24', 14, '2450.00'),
(11, 'MEDAN', '2017-05-27', 19, '2660.00'),
(12, 'TANGE', '2017-05-30', 14, '1397.50'),
(13, 'GRANC', '2017-05-03', 10, '650.00'),
(14, 'ISTAN', '2017-05-04', 14, '1386.50'),
(15, 'HELSI', '2017-05-04', 12, '1199.50'),
(16, 'MIAMI', '2017-05-05', 23, '2945.00'),
(17, 'RABAT', '2017-05-05', 14, '1475.00'),
(18, 'RABAT', '2017-05-05', 21, '1795.00'),
(19, 'GITES', '2017-05-10', 14, '1600.00'),
(20, 'LIMA', '2017-06-10', 28, '3395.00'),
(21, 'BANGK', '2017-06-10', 22, '2697.50'),
(22, 'SURUB', '2017-06-12', 28, '3333.00'),
(23, 'CAIRO', '2017-06-12', 8, '734.00'),
(24, 'BARCE', '2017-06-12', 9, '620.00'),
(25, 'DUSSD', '2017-06-13', 4, '420.00'),
(26, 'MOIRA', '2017-06-13', 10, '815.00'),
(27, 'MIAMI', '2017-06-15', 21, '2650.00'),
(28, 'CORSI', '2017-06-15', 10, '1200.00');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bestemming`
--
ALTER TABLE `bestemming`
  ADD PRIMARY KEY (`idbestemming`);

--
-- Indexen voor tabel `boeking`
--
ALTER TABLE `boeking`
  ADD PRIMARY KEY (`idboeking`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`idklant`);

--
-- Indexen voor tabel `reis`
--
ALTER TABLE `reis`
  ADD PRIMARY KEY (`idreis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
