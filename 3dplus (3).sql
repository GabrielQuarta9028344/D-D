-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 02 dec 2020 om 14:19
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
-- Database: `3dplus`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `film`
--

CREATE TABLE `film` (
  `filmid` int(5) NOT NULL,
  `filmnaam` varchar(50) DEFAULT NULL,
  `genreid` int(2) DEFAULT NULL,
  `releasejaar` int(4) DEFAULT NULL,
  `regisseur` varchar(50) DEFAULT NULL,
  `landherkomst` varchar(5) DEFAULT NULL,
  `duur` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `film`
--

INSERT INTO `film` (`filmid`, `filmnaam`, `genreid`, `releasejaar`, `regisseur`, `landherkomst`, `duur`) VALUES
(1, 'Avatar', 1, 2009, 'James Cameron', 'USA', 215),
(2, 'Bladerunner 2049', 1, 2018, 'Denis Villeneuve', 'USA', 166),
(3, 'Prometheus', 1, 2012, 'Ridley Scott', 'USA', 124),
(4, 'Alien covenant', 1, 2018, 'Ridley Scott', 'USA', 123),
(5, 'Star Wars - The Force Awakens', 1, 2015, 'J.J. Abrahams', 'USA', 136),
(6, 'Star Wars - The last Jedi', 1, 2018, 'Rian Johnson', 'USA', 153),
(7, 'Coco', 3, 2018, 'Lee Unkrich', 'USA', 105),
(8, 'Up', 3, 2009, 'Pete Docter', 'USA', 96),
(9, 'Despicable Me', 3, 2010, 'Pierre Coffin', 'USA', 95),
(10, 'Despicable Me 2', 3, 2013, 'Pierre Coffin', 'USA', 98),
(11, 'Despicable Me 3', 3, 2018, 'Kyle Balda', 'USA', 89),
(12, 'Pirates of the Caribbean - The Curse of the black ', 2, 2003, 'Gore Verbinski', 'USA', 143),
(13, 'Pirates of the Caribbean - Dead mans Chest', 2, 2006, 'Gore Verbinski', 'USA', 151),
(14, 'Pirates of the Caribbean - At worlds End', 2, 2007, 'Gore Verbinski', 'USA', 169),
(15, 'Pirates of the Caribbean - On stranger Tides', 2, 2011, 'Rob Marshall', 'USA', 136),
(16, 'Pirates of the Caribbean - Salazars REvenge', 2, 2018, 'Joachim Ronning', 'USA', 129),
(17, 'Guardians of the Galaxy', 7, 2014, 'James Gunn', 'USA', 121),
(18, 'Guardians of the Galaxy 2', 7, 2018, 'James Gunn', 'USA', 136),
(19, 'Beauty and the Beast', 6, 2018, 'Bill Condon', 'USA', 129),
(20, 'Fantastic Beasts and Where to Find Them', 6, 2017, 'David Yates', 'USA', 133),
(21, 'Gravity', 1, 2013, 'Alfonso Cuaron', 'USA', 91),
(22, 'Interstellar', 1, 2014, 'Christopher Nolan', 'USA', 169),
(23, 'Inception', 6, 2010, 'Christopher Nolan', 'USA', 148),
(24, 'Finding Nemo', 3, 2003, 'Andrew Stanton', 'USA', 100),
(25, 'Finding Dory', 3, 2017, 'Andrew Stanton', 'USA', 97),
(26, 'The Martian', 1, 2015, 'Ridley Scott', 'USA', 144),
(27, 'Everest', 2, 2015, 'Baltasar Kormukar', 'NWZ', 121),
(28, 'Minions', 3, 2015, 'Kyle Balda', 'USA', 91),
(29, 'The Hobbit - An unexpected Journey', 6, 2012, 'Peter Jackson', 'NWZ', 169),
(30, 'The Hobbit - The desolation of Smaug', 6, 2013, 'Peter Jackson', 'NWZ', 161),
(31, 'The Hobbit - The battle of 5 armies', 6, 2014, 'Peter Jackson', 'NWZ', 164),
(32, 'Maleficent', 6, 2014, 'Robert Stromberg', 'USA', 98),
(33, 'Galapagos 3D', 8, 2013, 'David Attenborough', 'UK', 96),
(34, 'Journey to the South Pacific', 8, 2013, 'Stephan Judson', 'USA', 97),
(35, 'Tarzan', 3, 2013, 'Reinhard Klooss', 'GER', 94),
(36, 'Life of Pi', 7, 2012, 'Ang Lee', 'USA', 127),
(37, 'Storm Surfers 3D', 2, 2012, 'Justin McMillan', 'AUS', 95),
(38, 'Harry Potter and the Deathly Hallows: Part 1', 6, 2010, 'David Yates', 'UK', 128),
(39, 'Harry Potter and the Deathly Hallows: Part 2', 6, 2011, 'David Yates', 'UK', 130),
(40, 'Harry Potter and the Half-Blood Prince', 6, 2010, 'David Yates', 'UK', 131),
(41, 'Harry Potter and the Order of the Phoenix', 6, 2007, 'David Yates', 'UK', 127),
(42, 'Ghost in the Shell', 1, 2018, 'Rupert Sanders', 'UK', 107),
(43, 'King Arthur: Legend of the Sword', 7, 2018, 'Guy Ritchie', 'USA', 126),
(44, 'Iron Man', 2, 2008, 'John Favreu', 'USA', 126),
(45, 'Iron Man 2', 2, 2010, 'John Favreu', 'USA', 122),
(46, 'Iron Man 3', 2, 2013, 'Shane Black', 'USA', 118),
(47, 'Vaiana', 3, 2017, 'Ron Clements', 'USA', 107),
(48, 'Robinson Crusoe', 3, 2017, 'Vincent Kesteloot', 'BEL', 91),
(49, 'The Secret Life of Pets', 3, 2017, 'Chris Renaud', 'JPN', 87),
(50, 'Pans Labyrinth', 6, 2006, 'Guillermo del Toro', 'MEX', 116),
(51, 'Passengers', 5, 2017, 'Morton Tyldum', 'USA', 116),
(52, 'Billy Lynns Long Halftime Walk', 5, 2017, 'Ang Lee', 'UK', 113),
(53, 'Docter Strange', 2, 2017, 'Scott Derickson', 'USA', 115),
(54, 'Miss Peregrines Home for Peculiar Children', 6, 2017, 'Tim Burton', 'UK', 127),
(55, 'Ben-Hur', 2, 2017, 'Timor Bekmambetov', 'USA', 123);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genre`
--

CREATE TABLE `genre` (
  `genreid` int(2) NOT NULL,
  `genrenaam` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `genre`
--

INSERT INTO `genre` (`genreid`, `genrenaam`) VALUES
(1, 'Science Fiction'),
(2, 'Action'),
(3, 'Animation'),
(4, 'Comedy'),
(5, 'Drama'),
(6, 'Fantasy'),
(7, 'Adventure'),
(8, 'Nature');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `klantid` int(5) NOT NULL,
  `voornaam` varchar(25) DEFAULT NULL,
  `achternaam` varchar(45) DEFAULT NULL,
  `adres` varchar(25) DEFAULT NULL,
  `postcode` varchar(6) DEFAULT NULL,
  `plaats` varchar(35) DEFAULT NULL,
  `telefoon` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `gebdatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`klantid`, `voornaam`, `achternaam`, `adres`, `postcode`, `plaats`, `telefoon`, `email`, `gebdatum`) VALUES
(1, 'Robert', 'Boorsma', 'Esdoorn 8', '3224EK', 'Hellevoetsluis', '0181181123', 'rb23@hotmail.com', '1994-01-18'),
(2, 'Ferdinand', 'Boden', 'Zomerhoek 2', '6224HH', 'Ermelo', '0381897543', 'fer17@gmail.com', '1995-07-06'),
(3, 'Rachid', 'Loukili', 'Burg van de Meer straat', '1824WS', 'Zoetermeer', '0274537653', 'rachidloukili@gmail.com', '1995-07-26'),
(4, 'Bert', 'Bunder', 'Groenesteeg 82', '8456TG', 'Doetinchem', '0556753214', 'bbun@farmmail.com', '1990-05-23'),
(5, 'Emre', 'Hussein', 'Koperhoek 209', '1267BK', 'Voorschoten', '0151185438', 'emhus@gmail.com', '1990-10-09'),
(6, 'Marcel', 'Kranenburg', 'Kerkweg 12a', '3214VD', 'Zuidland', '0181452700', 'mkran@hotmail.com', '1991-04-23'),
(7, 'Denise', 'Farah', 'Fagotstraat 29', '4224TR', 'Apeldoorn', '0384181100', 'dfarah@live.com', '1992-01-16'),
(8, 'Sonny', 'Merhuis', 'Berglaan 25', '3202KB', 'Spijkenisse', '0181340341', NULL, '1967-11-23'),
(9, 'Judith', 'Krijgsman', 'Golda Meirstraat 80', '3207AD', 'Spijkenisse', '0108626798', 'judithk@mail.nl', '1987-09-09'),
(10, 'Yussef', 'Unal', 'Meijerstraat 80', '7207AD', 'Steenwijk', '0880626798', 'yussef87@mail.nl', '1987-11-09'),
(11, 'Donald', 'Johansen', 'Eendenstraat', '3333DF', 'Dordrecht', '0674532361', 'Donald@upcmail.nl', '1969-05-11'),
(12, 'Johan', 'Balken', 'Hokkenlaan 67', '7853KI', 'Zwijndrecht', '0698712343', 'Johan@ziggo.nl', '1985-10-08'),
(13, 'Wim', 'Klokmaker', 'Torentjeslaan 13', '4126PA', 'Den Haag', '0164163578', 'Wimklok@ziggo.nl', '1981-07-16'),
(14, 'Michael', 'Schubber', 'Racelaan 56a', '6468AS', 'Zandvoort', '0673017321', NULL, '1986-05-12'),
(15, 'Yessin', 'Yilmaz', 'Prinsessestraat 356', '4654FG', 'Barendrecht', '4564984984', 'henven@uopcmail.nl', '1989-09-19'),
(17, 'Rob', 'Nasaki', 'Boezemstraat 89', '3171AC', 'Poortugaal', '0105043198', 'RobNaskan@hotmail.com', '1991-07-21'),
(19, 'Piet', 'Verschoren', 'Tulpenstraat 56', '4845DH', 'Amstelveen', '0105469898', 'Pet23@tisdcali.nl', '1983-11-15'),
(20, 'Mira', 'Demir', 'Zonnebloemstraat 678', '3526LL', 'Hekelingen', '0181562908', 'Pietjanssen@kpnmail.nl', '1956-02-02'),
(21, 'Martin', 'Groot de', 'Computerlaan 128', '5487BC', 'Zwolle', '0805316543', 'Mgroot@hotmail.com', '1964-09-29'),
(22, 'Wout', 'Molendijk', 'Macranderweg 34', '3425MD', 'Spijkenisse', '0181349686', 'Woutje@kpnmail.nl', '1979-08-18'),
(23, 'Michael', 'Tollen', 'Schiedamsepad 1', '3223KT', 'Hellevoetsluis', '0618745421', 'MT1963@hotmail.com', '1976-04-26'),
(24, 'Ronald', 'Keuken van', 'Da Costalaan89', '3256CA', 'Barendrecht', '0671524308', 'ronald@upcmail.nl', '1989-06-25'),
(25, 'Arnold', 'Koperslager', 'Copernicuslaan 45', '3208BR', 'Spijkenisse', '0181497198', 'arnoldk@ziggo.nl', '1983-02-17'),
(26, 'Enes', 'Yildirim', 'Baardweg 45', '3205GL', 'Spijkenisse', '0181458564', 'Richard@Wilkinson.com', '1980-12-19'),
(27, 'Corrie', 'Steen van', 'Zilverreiger 26', '3191PK', 'Hoogvliet', '0101122143', 'Steen@hoogvliet.nl', '1989-01-21'),
(28, 'Ardie', 'Ruiter de', 'Markenlaan 64', '3589XC', 'Zwolle', '0805456465', 'arru@kpnmail.nl', '1959-10-07'),
(29, 'Nina', 'Louteren', 'Saturnusstraat 38d', '3204XL', 'Hoogvliet', '0616062233', 'ninalouter@hotmail.com', '1977-12-09'),
(30, 'Sophia', 'Merkel', 'Albrandswaardseweg 2', '3171AD', 'Poortugaal', '0105413317', 'sophiamerkel@upcmail.nl', '1987-06-13'),
(31, 'Selen', 'Yilmaz', 'Saturnusstraat 38d', '3204XL', 'Hoogvliet', '0619962233', 'selen@hotmail.com', '1977-10-19'),
(32, 'Bert', 'Merkel', 'Albrandswaardseweg 2', '3171AD', 'Poortugaal', '0105413317', 'bertmerkel@upcmail.nl', '1987-08-17'),
(33, 'Bas', 'Merkel', 'Albrandswaardseweg 2', '3171AD', 'Poortugaal', '0105413317', NULL, '1982-08-17'),
(34, 'Jan', 'Vuuren van', 'Bastion 5', '3221LE', 'Hellevoetsluis', '0181317346', 'vuuren@mail.com', '1995-06-11'),
(35, 'Adrie', 'Baggerman', 'Nassaustraat 141', '2983RD', 'Ridderkerk', '0180417567', 'baggerman@mail.com', '1997-05-07'),
(36, 'Pieter', 'Wubben', 'Evenaar 68', '3067DA', 'Rotterdam', '0104205259', 'wubben@mail.com', '1998-09-12'),
(37, 'Eslem', 'Demir', 'Maisdreef 8', '3204GM', 'Spijkenisse', '0181638923', NULL, '2000-10-21'),
(38, 'Koos', 'Pieterman', 'De wouden 93', '9405HC', 'Assen', '0592358938', 'pieterman@mail.com', '2000-03-11'),
(39, 'Felix', 'Taks', 'De koppele 777', '5632LV', 'Eindhoven', '0402420368', NULL, '1991-04-30'),
(40, 'Willy', 'Ruigrok', 'Pompstraat 47', '3082RR', 'Rotterdam', '0104553694', 'ruigrok@mail.com', '1982-05-20'),
(41, 'Petra', 'Waardenburg', 'Koenraadlaan 50', '5651EW', 'Eindhoven', '0402518367', NULL, '1977-01-01'),
(42, 'Jeannette', 'Ramaker', 'Heideanjer 44', '7721HE', 'Dalfsen', '0529438493', 'ramaker@mail.com', '1976-05-25'),
(43, 'Suzanne', 'Jansen', 'Delkant 4', '5311CJ', 'Gameren', '0418563829', 'jansen-s@mail.com', '1988-11-17'),
(44, 'Berra', 'Dogan', 'Nassaulaan 4', '3116EV', 'Schiedam', '0104265028', 'doganberra@mail.com', '1994-08-19'),
(45, 'Ria', 'Brigman', 'Bolderwerk 5', '3134MA', 'Vlaardingen', '0104354223', 'brigman@mail.com', '1985-09-15'),
(46, 'Stanley', 'Pedersen', 'Drinkwaterweg 404', '3063JC', 'Rotterdam', '0104182219', NULL, '1997-02-11'),
(47, 'Steven', 'Slootweg', 'Platanendreef 6', '3137CN', 'Vlaardingen', '0104730435', 'slootweg@mail.com', '1996-03-05'),
(48, 'Deborah', 'Brugman', 'Edisonstraat 34 a', '3112LW', 'Schiedam', '0104704951', 'brugman@mail.com', '1999-08-09'),
(49, 'Rayen', 'Aslan', 'Prinsenlaan 393', '3067TX', 'Rotterdam', '0104804674', 'rayenaslan@mail.com', '1998-04-10'),
(50, 'Emine', 'Abdi', 'Gemeenlandsedijk 4', '3216AG', 'Abbenbroek', '0181669241', 'emine@mail.com', '1957-03-10'),
(51, 'Priscilla', 'Antes', 'Merelstraat 4', '4793HA', 'Fijnaart', '0168462236', 'antes@mail.com', '1956-02-02'),
(52, 'Deniz', 'Kanhai', 'Ankerstraat 16', '7071WH', 'Ulft', '0315681206', NULL, '1989-08-23'),
(53, 'Harold', 'Stein', 'Buitenbrinkweg 54', '3853LX', 'Ermelo', '0341553246', NULL, '1999-08-09'),
(54, 'Knut', 'Holgers', 'Juckemastraat 23', '8801GL', 'Franeker', '0517395068', 'holgers@mail.com', '1999-09-09'),
(55, 'Esmee', 'Jaggers', 'Schorpioenstraat 282', '3067KW', 'Rotterdam', '0104565551', 'jaggersesmee@mail.com', '1999-05-19'),
(56, 'John', 'Overweg', 'Waterweg 40', '3063JX', 'Rotterdam', '0104183319', NULL, '1985-07-11'),
(57, 'Erich', 'Swartz', 'Greefstraat 6', '6137CN', 'Zwolle', '0524730435', 'swartz@mail.com', '2000-08-12'),
(58, 'Mohammed', 'Hassan', 'Edisonstraat 34 a', '5112LW', 'Amersfoort', '0304704951', 'mo@mail.com', '2001-04-19'),
(59, 'Levi', 'Jacobs', 'Rozenlaan 393', '5067TX', 'Amersfoort', '0304804674', 'levi@mail.com', '2001-02-08'),
(60, 'Aysel', 'Celik', 'Zuidlandsedijk 4', '5216AG', 'Deventer', '0534669241', 'celik@mail.com', '2001-09-05'),
(61, 'Sibil', 'Said', 'Vinkstraat 4', '5793HA', 'Deventer', '0538462236', 'sibil@mail.com', '2001-05-29'),
(62, 'Tonia', 'Kalloe', 'Donkerstraat 16', '8071WH', 'Tilburg', '0815681206', NULL, '1986-08-17'),
(63, 'Johnny', 'Gier de', 'Brinkweg 54', '9853LX', 'Eindhoven', '0941553246', NULL, '1999-12-09'),
(64, 'Sven', 'Sorengard', 'Rembrandtstraat 23', '9801GL', 'Eindhoven', '0617395068', 'sven@mail.com', '2000-12-15'),
(65, 'Scott', 'Jamers', 'Schorsstraat 282', '9067KW', 'Tilburg', '0614565551', 'sjamers@mail.com', '1991-06-12'),
(66, 'Xiji', 'Zhang', 'Boschstraat 23', '9822GL', 'Breda', '0644395068', 'Bovenlander@mail.com', '1993-01-12'),
(67, 'WeiWei', 'Xu', 'Bosstraat 282', '9867KW', 'Breda', '0614577551', 'lamers@mail.com', '1988-04-03');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reservering`
--

CREATE TABLE `reservering` (
  `reserveringid` int(6) NOT NULL,
  `klantid` int(5) DEFAULT NULL,
  `filmid` int(5) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `aantalpersonen` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `reservering`
--

INSERT INTO `reservering` (`reserveringid`, `klantid`, `filmid`, `datum`, `aantalpersonen`) VALUES
(1, 63, 31, '2018-05-12', 6),
(2, 17, 2, '2018-02-15', 5),
(3, 11, 37, '2018-11-13', 6),
(4, 31, 35, '2017-09-22', 1),
(5, 58, 5, '2019-12-23', 2),
(6, 46, 25, '2019-04-27', 6),
(7, 22, 16, '2019-01-13', 2),
(8, 44, 7, '2017-05-07', 5),
(9, 48, 13, '2019-02-27', 4),
(10, 23, 2, '2018-10-30', 3),
(11, 7, 11, '2019-07-17', 5),
(12, 29, 46, '2018-02-01', 2),
(13, 14, 17, '2018-07-09', 5),
(14, 22, 37, '2018-06-08', 6),
(15, 3, 41, '2019-03-20', 5),
(16, 2, 44, '2019-07-03', 5),
(17, 25, 1, '2019-12-29', 2),
(18, 43, 5, '2019-10-04', 6),
(19, 33, 28, '2018-12-03', 4),
(20, 54, 26, '2019-11-24', 3),
(21, 23, 29, '2017-11-01', 2),
(22, 7, 49, '2017-06-12', 3),
(23, 46, 35, '2020-02-28', 1),
(24, 24, 6, '2019-07-25', 1),
(25, 67, 9, '2017-02-23', 3),
(26, 13, 26, '2018-11-28', 5),
(27, 22, 21, '2017-11-05', 6),
(28, 41, 33, '2017-12-01', 3),
(29, 41, 54, '2019-05-29', 5),
(30, 12, 31, '2019-10-20', 2),
(31, 53, 23, '2018-12-05', 1),
(32, 23, 9, '2018-03-15', 1),
(33, 17, 47, '2018-02-10', 1),
(34, 59, 5, '2017-03-11', 6),
(35, 59, 19, '2017-07-21', 6),
(36, 39, 6, '2018-11-24', 1),
(37, 43, 3, '2017-06-20', 4),
(38, 11, 13, '2018-03-03', 6),
(39, 63, 17, '2019-11-03', 2),
(40, 28, 29, '2019-07-25', 4),
(41, 47, 25, '2018-12-24', 4),
(42, 57, 11, '2017-06-23', 6),
(43, 67, 44, '2019-04-03', 6),
(44, 44, 24, '2017-04-03', 4),
(45, 51, 12, '2017-01-10', 1),
(46, 40, 4, '2017-06-27', 6),
(47, 55, 30, '2018-08-29', 5),
(48, 67, 42, '2017-05-30', 3),
(49, 11, 16, '2019-10-21', 6),
(50, 17, 27, '2019-06-22', 3),
(51, 65, 28, '2018-08-21', 2),
(52, 64, 51, '2020-02-02', 5),
(53, 4, 33, '2018-09-03', 3),
(54, 37, 18, '2020-02-17', 2),
(55, 8, 21, '2017-05-04', 3),
(56, 41, 48, '2018-10-08', 4),
(57, 12, 35, '2017-04-10', 1),
(58, 61, 20, '2018-12-29', 1),
(59, 29, 3, '2018-10-08', 3),
(60, 13, 18, '2018-08-10', 4),
(61, 46, 18, '2019-10-10', 6),
(62, 31, 23, '2017-02-14', 3),
(63, 58, 25, '2018-02-01', 2),
(64, 35, 18, '2018-03-29', 6),
(65, 56, 11, '2019-05-04', 2),
(66, 45, 46, '2018-08-22', 3),
(67, 17, 39, '2019-11-17', 1),
(68, 12, 28, '2018-07-30', 4),
(69, 58, 21, '2017-06-11', 2),
(70, 42, 24, '2017-07-19', 4),
(71, 20, 38, '2019-11-12', 4),
(72, 42, 33, '2017-06-27', 3),
(73, 51, 12, '2018-12-15', 3),
(74, 46, 40, '2017-08-17', 6),
(75, 51, 53, '2019-08-01', 3),
(76, 6, 54, '2017-02-11', 3),
(77, 61, 40, '2018-06-28', 4),
(78, 66, 19, '2017-05-13', 6),
(79, 14, 31, '2017-07-05', 5),
(80, 40, 17, '2017-08-12', 3),
(81, 2, 8, '2019-10-19', 3),
(82, 67, 13, '2017-11-28', 4),
(83, 57, 3, '2018-05-18', 5),
(84, 45, 30, '2019-04-12', 3),
(85, 9, 20, '2019-11-10', 2),
(86, 10, 47, '2017-05-29', 5),
(87, 59, 17, '2017-03-25', 2),
(88, 35, 40, '2017-11-16', 3),
(89, 34, 52, '2019-11-19', 6),
(90, 3, 54, '2018-01-13', 2),
(91, 4, 27, '2018-09-30', 3),
(92, 31, 11, '2017-05-16', 1),
(93, 39, 14, '2017-08-04', 4),
(94, 62, 21, '2019-06-11', 2),
(95, 42, 27, '2019-05-25', 4),
(96, 5, 6, '2020-01-10', 4),
(97, 34, 5, '2017-04-22', 3),
(98, 31, 39, '2017-06-01', 3),
(99, 53, 29, '2019-11-13', 4),
(100, 62, 51, '2019-05-11', 4),
(101, 2, 12, '2019-08-08', 6),
(102, 58, 37, '2018-10-02', 6),
(103, 27, 29, '2018-04-24', 1),
(104, 48, 50, '2019-03-31', 4),
(105, 24, 7, '2017-01-01', 2),
(106, 38, 15, '2018-06-11', 4),
(107, 11, 28, '2019-02-13', 2),
(108, 27, 1, '2019-03-08', 5),
(109, 56, 45, '2018-04-05', 6),
(110, 66, 44, '2019-05-06', 5),
(111, 6, 21, '2020-02-27', 2),
(112, 54, 50, '2018-08-16', 3),
(113, 64, 22, '2017-07-18', 1),
(114, 6, 21, '2017-09-21', 4),
(115, 22, 24, '2017-06-12', 4),
(116, 52, 12, '2017-08-27', 3),
(117, 25, 28, '2019-11-15', 3),
(118, 31, 41, '2018-11-17', 6),
(119, 49, 2, '2017-03-25', 2),
(120, 44, 46, '2020-02-26', 1),
(121, 25, 2, '2017-09-02', 3),
(122, 55, 45, '2018-02-15', 2),
(123, 51, 38, '2019-06-27', 6),
(124, 40, 49, '2017-03-02', 4),
(125, 54, 41, '2019-07-14', 4),
(126, 37, 16, '2018-07-24', 2),
(127, 1, 8, '2018-06-05', 1),
(128, 60, 5, '2018-02-25', 4),
(129, 15, 51, '2018-01-04', 6),
(130, 4, 11, '2018-12-12', 4),
(131, 33, 6, '2018-05-19', 5),
(132, 64, 19, '2017-11-15', 1),
(133, 5, 52, '2019-11-01', 4),
(134, 1, 13, '2017-02-12', 2),
(135, 45, 53, '2019-01-28', 1),
(136, 65, 35, '2018-01-14', 3),
(137, 33, 11, '2018-05-12', 2),
(138, 39, 38, '2017-08-02', 6),
(139, 65, 15, '2017-05-13', 3),
(140, 40, 38, '2017-07-09', 6),
(141, 41, 24, '2019-10-18', 4),
(142, 8, 7, '2019-08-19', 4),
(143, 40, 14, '2017-12-16', 3),
(144, 1, 4, '2018-03-05', 6),
(145, 32, 35, '2017-03-19', 3),
(146, 58, 16, '2017-05-04', 4),
(147, 12, 30, '2018-08-30', 3),
(148, 46, 39, '2017-12-17', 2),
(149, 60, 16, '2017-07-07', 2),
(150, 19, 49, '2019-03-28', 6),
(151, 10, 48, '2017-01-31', 2),
(152, 57, 46, '2019-04-03', 4),
(153, 32, 50, '2018-03-29', 2),
(154, 20, 1, '2018-12-30', 3),
(155, 35, 46, '2019-07-23', 5),
(156, 40, 33, '2018-02-15', 6),
(157, 53, 37, '2019-03-07', 3),
(158, 11, 40, '2019-10-08', 1),
(159, 31, 26, '2019-09-13', 2),
(160, 50, 17, '2020-02-17', 6),
(161, 6, 23, '2019-04-10', 5),
(162, 47, 20, '2017-11-24', 5),
(163, 41, 16, '2018-08-20', 2),
(164, 43, 28, '2019-08-06', 3),
(165, 60, 24, '2018-07-08', 2),
(166, 45, 26, '2019-12-29', 2),
(167, 47, 48, '2019-01-19', 3),
(168, 55, 19, '2017-12-24', 2),
(169, 63, 33, '2017-04-14', 1),
(170, 63, 2, '2019-08-04', 4),
(171, 15, 30, '2019-04-12', 1),
(172, 58, 15, '2018-07-28', 2),
(173, 14, 20, '2019-07-18', 5),
(174, 17, 34, '2018-10-30', 4),
(175, 43, 50, '2018-05-31', 3),
(176, 48, 17, '2019-01-25', 6),
(177, 48, 7, '2017-06-15', 4),
(178, 66, 48, '2018-10-24', 6),
(179, 19, 28, '2017-08-30', 1),
(180, 46, 39, '2017-03-10', 6),
(181, 31, 41, '2017-12-09', 4),
(182, 66, 2, '2019-01-05', 6),
(183, 17, 54, '2019-08-22', 6),
(184, 67, 24, '2018-08-16', 2),
(185, 25, 34, '2019-05-21', 6),
(186, 31, 10, '2017-08-04', 6),
(187, 25, 49, '2020-02-25', 6),
(188, 49, 45, '2017-12-22', 1),
(189, 17, 42, '2019-09-16', 3),
(190, 10, 1, '2018-12-22', 3),
(191, 1, 6, '2019-04-13', 2),
(192, 43, 45, '2017-10-31', 4),
(193, 54, 3, '2020-01-19', 3),
(194, 26, 42, '2019-01-06', 6),
(195, 39, 31, '2020-02-28', 2),
(196, 47, 37, '2018-03-15', 4),
(197, 30, 11, '2017-08-26', 3),
(198, 6, 4, '2019-12-17', 1),
(199, 19, 3, '2019-12-10', 1),
(200, 52, 40, '2017-10-14', 3);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`filmid`);

--
-- Indexen voor tabel `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreid`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`klantid`);

--
-- Indexen voor tabel `reservering`
--
ALTER TABLE `reservering`
  ADD PRIMARY KEY (`reserveringid`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `reservering`
--
ALTER TABLE `reservering`
  MODIFY `reserveringid` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
