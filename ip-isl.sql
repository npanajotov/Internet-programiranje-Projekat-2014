-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ip-isl`
--
CREATE DATABASE IF NOT EXISTS `ip-isl` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ip-isl`;

-- --------------------------------------------------------

--
-- Table structure for table `artikal`
--

CREATE TABLE IF NOT EXISTS `artikal` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `evbroj` int(10) NOT NULL,
  `datumgarancije` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `idkompanije` int(10) NOT NULL,
  `datumnabavke` date NOT NULL,
  `vrednoste` int(10) NOT NULL,
  `vrednostdin` int(10) NOT NULL,
  `idlabaratorije` int(10) NOT NULL,
  `status` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `kategorija` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`evbroj`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `artikal`
--

INSERT INTO `artikal` (`id`, `naziv`, `model`, `evbroj`, `datumgarancije`, `idkompanije`, `datumnabavke`, `vrednoste`, `vrednostdin`, `idlabaratorije`, `status`, `kategorija`) VALUES
(2, 'Racunar', 'Intel Pentium IV 3.0', 99, '2013-02-28', 2, '2014-02-01', 1, 100, 3, 'Ispravno', 'osnovna'),
(3, 'Mis', 'Logitech', 33, '2014-02-28', 1, '2014-02-01', 10, 1000, 3, 'Neispravno', 'osnovna'),
(4, 'Mis', 'Logitech', 33, '2014-02-28', 1, '2014-02-01', 10, 1000, 4, 'Ispravno', 'osnovna'),
(8, 'Tastatura', 'Logitech', 48, '1992-12-20', 1, '1992-12-20', 78, 9000, 3, 'Treba odpisati', 'osnovna'),
(12, 'Sto', 'Random', 12, '1999-12-12', 3, '1998-12-12', 9, 1000, 4, 'Ispravno', 'pomocna'),
(14, 'Stolica', 'Nebitno', 22, '2015-12-12', 1, '2014-01-01', 852, 90000, 4, 'ispravno', 'pomocna'),
(15, 'Mikrofon', 'Sony', 89, '2020-12-12', 2, '2012-01-01', 15000, 130, 5, 'Odneto na servis', 'osnovna');

-- --------------------------------------------------------

--
-- Table structure for table `kompanija`
--

CREATE TABLE IF NOT EXISTS `kompanija` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `adresa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefon` int(10) unsigned zerofill NOT NULL,
  `mejl` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pib` int(20) NOT NULL,
  `kontaktosoba` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `kompanija`
--

INSERT INTO `kompanija` (`id`, `naziv`, `adresa`, `telefon`, `mejl`, `pib`, `kontaktosoba`) VALUES
(1, 'Forma Ideale', 'Tutinovacka 238', 01125252525, 'forma@ideale.rs', 999888444, 'Ivan Jovanovic'),
(2, 'Gustav', 'Maricka 9', 01125262728, 'gustav@cafe.com', 111222333, 'Nikoleta Jovanovic'),
(3, 'Alfa Computers', 'Beogradska 12', 01125242424, 'kona@gmail.com', 77889941, 'Milorad Maric');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE IF NOT EXISTS `korisnici` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `korisnickoime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lozinka` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `adresa` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mejl` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefon` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `nivopristupa` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `korisnickoime`, `lozinka`, `adresa`, `mejl`, `telefon`, `status`, `nivopristupa`) VALUES
(1, 'Nikola', 'Nikolic', 'admin', 'admin', 'Adresa kuce 1', 'kona@gmail.com', 011123456, 1, 3),
(2, 'Zeljko', 'Zeljkovic', 'magacin', 'magacin', 'Adresa kuce 2', 'zeljko@gmail.com', 011123456, 1, 2),
(3, 'Filip', 'Filipovic', 'labaratorija', 'labaratorija', 'Adresa kuce 13', 'filiphrnjak@gmail.com', 011123456, 1, 1),
(4, 'Drazen', 'Drazenovic', 'drazen', 'drazen', 'Vojvode Misica 12', 'drazendraskovic@gmail.com', 3222158, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `labaratorija`
--

CREATE TABLE IF NOT EXISTS `labaratorija` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `kvadratura` int(10) NOT NULL,
  `brojrmesta` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `labaratorija`
--

INSERT INTO `labaratorija` (`id`, `naziv`, `kvadratura`, `brojrmesta`) VALUES
(3, 'Sala Desno', 100, 10),
(4, 'Sala Levo', 50, 2),
(5, 'HD-TV Studio', 120, 12);

-- --------------------------------------------------------

--
-- Table structure for table `sef_labaratorije`
--

CREATE TABLE IF NOT EXISTS `sef_labaratorije` (
  `idlabaratorije` int(10) NOT NULL,
  `korisnickoime` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sef_labaratorije`
--

INSERT INTO `sef_labaratorije` (`idlabaratorije`, `korisnickoime`) VALUES
(5, 'zeljko'),
(3, 'labaratorija'),
(5, 'labaratorija'),
(4, 'drazen');

-- --------------------------------------------------------

--
-- Table structure for table `sifrarnik`
--

CREATE TABLE IF NOT EXISTS `sifrarnik` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sifrarnik`
--

INSERT INTO `sifrarnik` (`id`, `status`) VALUES
(1, 'Ispravno'),
(2, 'Neispravno'),
(3, 'Traba servisirati'),
(4, 'Odneto na servis'),
(5, 'Vraceno sa servisa'),
(6, 'Treba odpisati'),
(7, 'Otpisano');

-- --------------------------------------------------------

--
-- Table structure for table `zahtevi`
--

CREATE TABLE IF NOT EXISTS `zahtevi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idlabaratorije` int(10) NOT NULL,
  `naziv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kategorija` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `kolicina` int(10) NOT NULL,
  `korisnickoime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `zahtevi`
--

INSERT INTO `zahtevi` (`id`, `idlabaratorije`, `naziv`, `model`, `kategorija`, `kolicina`, `korisnickoime`) VALUES
(3, 5, 'Zvucnici', 'Logitech', 'osnovna', 1, 'kona'),
(5, 5, 'Kamera', 'Panasonic', 'osnovna', 1, 'filiphrnjak'),
(6, 5, 'Kamera', 'JVC', 'osnovna', 20, 'filiphrnjak');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
