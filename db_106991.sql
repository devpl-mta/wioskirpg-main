-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 54.38.131.251:3306
-- Generation Time: Paź 17, 2024 at 08:32 PM
-- Wersja serwera: 10.5.26-MariaDB-0+deb11u2
-- Wersja PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_106991`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `aj`
--

CREATE TABLE `aj` (
  `Serial` text NOT NULL,
  `Termin` text NOT NULL,
  `Cela` int(11) NOT NULL,
  `Powod` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `borsuk-jobs`
--

CREATE TABLE `borsuk-jobs` (
  `uid` int(11) NOT NULL,
  `job` text NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ec_prezenty`
--

CREATE TABLE `ec_prezenty` (
  `id` int(11) NOT NULL,
  `prezenty` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ec_prezenty`
--

INSERT INTO `ec_prezenty` (`id`, `prezenty`) VALUES
(1, '[ [ 1 ] ]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `H_Stereo`
--

CREATE TABLE `H_Stereo` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `link` text DEFAULT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kody`
--

CREATE TABLE `kody` (
  `kod` varchar(8) DEFAULT NULL,
  `uzyty` varchar(255) DEFAULT NULL,
  `dni` int(11) NOT NULL DEFAULT 1508 COMMENT '1508 - 15 dni / 1509 - 30 dni!',
  `aktywowaluid` int(121) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logi_bankomat`
--

CREATE TABLE `logi_bankomat` (
  `sid` int(11) NOT NULL,
  `nick` text NOT NULL,
  `serial` text NOT NULL,
  `ile` int(11) NOT NULL,
  `typ` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Logi_cmd`
--

CREATE TABLE `Logi_cmd` (
  `ID` text NOT NULL,
  `osoba` text NOT NULL,
  `data` text NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Logi_minuty_frakcja`
--

CREATE TABLE `Logi_minuty_frakcja` (
  `ID` text NOT NULL,
  `osoba` text NOT NULL,
  `data` text NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lss_domy`
--

CREATE TABLE `lss_domy` (
  `id` int(10) UNSIGNED NOT NULL,
  `descr` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Dom',
  `i` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'interior w ktorym jest wejscie i wyjscie z domu',
  `vwe` int(11) NOT NULL DEFAULT 0 COMMENT 'vw wejscia (prawie zawsze 0)',
  `vwi` int(11) DEFAULT NULL COMMENT 'VW wnetrza (nadawane automatycznie, tu mozna wymusic)',
  `drzwi` varchar(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'x,y,z miejsce w ktorym bedzie pickup wchodzenia',
  `punkt_wyjscia` varchar(64) NOT NULL COMMENT 'x,y,z,[rz] miejsce gdzie przeniesie po wyjsciu',
  `interiorid` int(10) UNSIGNED DEFAULT 221 COMMENT 'numer wnetrza z tablicy pbp_interiory',
  `ownerid` int(10) UNSIGNED DEFAULT NULL COMMENT 'numer wlasciciela z tablicy players',
  `zamkniety` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=zawsze otwarty',
  `koszt` int(5) UNSIGNED NOT NULL DEFAULT 100,
  `paidTo` date DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'uzywane do wykrywania zaktualizowanych przez panel domow',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `d.lokator1` int(11) DEFAULT NULL,
  `d.lokator2` int(11) DEFAULT NULL,
  `d.lokator3` int(11) DEFAULT NULL,
  `lokator1` int(11) DEFAULT NULL,
  `lokator2` int(11) DEFAULT NULL,
  `lokator3` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lss_interiory`
--

CREATE TABLE `lss_interiory` (
  `id` int(10) UNSIGNED NOT NULL,
  `interior` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `entrance` varchar(64) NOT NULL COMMENT 'x,y,z,a - miejsce gdzie pojawi sie gracz po wejsciu',
  `exit` varchar(64) DEFAULT NULL COMMENT 'x,y,z - miejsce gdzie bedzie marker wyjscia',
  `opis` varchar(64) DEFAULT NULL COMMENT 'opis do wyszukiwarki',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `dimension` int(10) UNSIGNED DEFAULT NULL,
  `koszt` mediumint(8) UNSIGNED NOT NULL DEFAULT 5000,
  `notes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ms_organizacje`
--

CREATE TABLE `ms_organizacje` (
  `code` varchar(31) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `login` varchar(121) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `rank` int(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nv_infopickups`
--

CREATE TABLE `nv_infopickups` (
  `dbid` int(11) NOT NULL,
  `xyz` text NOT NULL,
  `dimension` int(11) NOT NULL,
  `interior` int(11) NOT NULL,
  `text` text NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nv_wiezienie`
--

CREATE TABLE `nv_wiezienie` (
  `id` int(11) NOT NULL,
  `nick` text NOT NULL,
  `serial` text NOT NULL,
  `powod` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cela` int(11) NOT NULL,
  `gosciu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nv_znajdzki`
--

CREATE TABLE `nv_znajdzki` (
  `id` int(11) NOT NULL,
  `prezenty` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ogrpg_jobs`
--

CREATE TABLE `ogrpg_jobs` (
  `code` varchar(120) NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp(),
  `NULL` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ogrpg_office`
--

CREATE TABLE `ogrpg_office` (
  `dodatek` int(11) NOT NULL,
  `code` text NOT NULL,
  `name` text NOT NULL,
  `spaces` int(11) NOT NULL DEFAULT 0,
  `maxspaces` int(11) NOT NULL DEFAULT 0,
  `reputation` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podanie_o_baze`
--

CREATE TABLE `podanie_o_baze` (
  `nazwa_org` text NOT NULL,
  `kto_wyslal` text NOT NULL,
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pseudonim`
--

CREATE TABLE `pseudonim` (
  `prawdziwylogin` text NOT NULL,
  `login` text NOT NULL,
  `zmienilna` text NOT NULL,
  `kiedy` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `PSP_drzewa`
--

CREATE TABLE `PSP_drzewa` (
  `ID` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `wielkosc` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_admins`
--

CREATE TABLE `pystories_admins` (
  `osoba` int(255) NOT NULL,
  `serial` text NOT NULL,
  `date` text NOT NULL,
  `level` tinyint(1) NOT NULL,
  `actived` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `added` timestamp NOT NULL DEFAULT current_timestamp(),
  `reporty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pystories_admins`
--

INSERT INTO `pystories_admins` (`osoba`, `serial`, `date`, `level`, `actived`, `added`, `reporty`) VALUES
(1, 'FE3B0D7B53ECE36468FF0BBF0B018644', '', 3, '0000-00-00 00:00:00', '2024-10-17 19:13:30', 0),
(2, '4032EFFF00A861D673EBE8E8CA4777E4', '', 3, '0000-00-00 00:00:00', '2024-10-17 19:19:34', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_ban`
--

CREATE TABLE `pystories_ban` (
  `serial` text NOT NULL,
  `reason` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `type` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `osoba` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_donates`
--

CREATE TABLE `pystories_donates` (
  `type` varchar(244) NOT NULL,
  `money` int(43) NOT NULL,
  `-` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_factions`
--

CREATE TABLE `pystories_factions` (
  `-` int(255) NOT NULL,
  `code` varchar(125) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `sid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `rank` int(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pystories_factions`
--

INSERT INTO `pystories_factions` (`-`, `code`, `sid`, `actived`, `rank`) VALUES
(1, 'SAPD', 2, '2024-10-17', 99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_importexport`
--

CREATE TABLE `pystories_importexport` (
  `sid` int(11) NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `limit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_jobs`
--

CREATE TABLE `pystories_jobs` (
  `code` varchar(120) NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp(),
  `NULL` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_logs`
--

CREATE TABLE `pystories_logs` (
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `osoba` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_logs_login`
--

CREATE TABLE `pystories_logs_login` (
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `serial` varchar(50) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_lotto`
--

CREATE TABLE `pystories_lotto` (
  `nr` bigint(20) NOT NULL,
  `serial` text NOT NULL,
  `nick` text NOT NULL,
  `sid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_office`
--

CREATE TABLE `pystories_office` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` text NOT NULL,
  `spaces` int(11) NOT NULL DEFAULT 5,
  `maxspaces` int(11) NOT NULL DEFAULT 0,
  `reputation` int(11) NOT NULL,
  `-` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_punish`
--

CREATE TABLE `pystories_punish` (
  `kolejnosc` int(11) NOT NULL,
  `serial` text NOT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `type` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_serials`
--

CREATE TABLE `pystories_serials` (
  `nick` text NOT NULL,
  `serial` text NOT NULL,
  `-` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_stereo`
--

CREATE TABLE `pystories_stereo` (
  `sid` int(11) NOT NULL,
  `nazwa` text NOT NULL,
  `link` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_users`
--

CREATE TABLE `pystories_users` (
  `id` int(11) NOT NULL,
  `login` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `login2` text DEFAULT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  `bank_money` bigint(99) NOT NULL DEFAULT 0,
  `karta_bank` text DEFAULT NULL,
  `prezent` int(11) DEFAULT NULL,
  `skin` int(11) NOT NULL DEFAULT 0,
  `weave` int(11) NOT NULL DEFAULT 50,
  `srp` int(11) NOT NULL DEFAULT 0,
  `punkty_nagroda` int(11) NOT NULL DEFAULT 0,
  `pjA` int(11) NOT NULL DEFAULT 0,
  `pjB` int(11) NOT NULL DEFAULT 0,
  `pjC` int(11) NOT NULL DEFAULT 0,
  `pjL` int(11) NOT NULL DEFAULT 0,
  `licS` int(11) NOT NULL DEFAULT 0,
  `worker` int(11) NOT NULL DEFAULT 0,
  `hours` int(12) NOT NULL,
  `mandate` int(10) NOT NULL DEFAULT 0,
  `registered` timestamp NOT NULL DEFAULT current_timestamp(),
  `register_serial` varchar(120) DEFAULT NULL,
  `dodatkowy_serial` varchar(120) DEFAULT NULL,
  `premiumdate` date NOT NULL DEFAULT '2030-03-03',
  `premiumplusdate` date NOT NULL DEFAULT '0000-00-00',
  `diamond` tinyint(1) NOT NULL DEFAULT 0,
  `premium` tinyint(1) NOT NULL DEFAULT 1,
  `dc_code` text NOT NULL,
  `mute` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paczki_magazynier` int(11) NOT NULL,
  `coal` int(11) NOT NULL,
  `maska` int(11) NOT NULL DEFAULT 0,
  `zestawfix` int(11) NOT NULL DEFAULT 0,
  `exp_taxo` int(11) NOT NULL DEFAULT 0,
  `maryha` int(11) NOT NULL DEFAULT 0,
  `maryha_przerobiona` int(11) NOT NULL DEFAULT 0,
  `pjS` int(11) NOT NULL DEFAULT 0,
  `listonosz` int(11) NOT NULL,
  `wedka` int(11) NOT NULL,
  `rybak` int(11) NOT NULL,
  `iron` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `lvl` int(25) NOT NULL,
  `exp` bigint(20) NOT NULL,
  `position` text NOT NULL,
  `odebrana_exp` int(11) NOT NULL DEFAULT 0,
  `odebrana_darmowa` int(11) NOT NULL,
  `odebrana_kasa` int(11) NOT NULL,
  `kille` bigint(20) NOT NULL,
  `zgony` bigint(20) NOT NULL,
  `discord_connected` text NOT NULL DEFAULT 'Nie',
  `premium_sprawdzone` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Neveron';

--
-- Dumping data for table `pystories_users`
--

INSERT INTO `pystories_users` (`id`, `login`, `login2`, `password`, `money`, `bank_money`, `karta_bank`, `prezent`, `skin`, `weave`, `srp`, `punkty_nagroda`, `pjA`, `pjB`, `pjC`, `pjL`, `licS`, `worker`, `hours`, `mandate`, `registered`, `register_serial`, `dodatkowy_serial`, `premiumdate`, `premiumplusdate`, `diamond`, `premium`, `dc_code`, `mute`, `paczki_magazynier`, `coal`, `maska`, `zestawfix`, `exp_taxo`, `maryha`, `maryha_przerobiona`, `pjS`, `listonosz`, `wedka`, `rybak`, `iron`, `gold`, `lvl`, `exp`, `position`, `odebrana_exp`, `odebrana_darmowa`, `odebrana_kasa`, `kille`, `zgony`, `discord_connected`, `premium_sprawdzone`) VALUES
(1, 'devpl', NULL, 'F34CDF8836999DFEF54A6963E043D768', 899324174, 99947050, NULL, NULL, 238, 50, 0, 34, 0, 1, 0, 0, 0, 0, 72, 0, '2024-10-16 22:00:00', 'FE3B0D7B53ECE36468FF0BBF0B018644', NULL, '2030-03-03', '0000-00-00', 0, 1, '850239', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 36, '', 0, 1, 0, 0, 0, 'Tak', 0),
(2, 'MrJooker', NULL, '52E0C7C23BEF48FD93872E74045FC4BF', 997606999, 0, NULL, NULL, 0, 50, 0, 36, 0, 0, 0, 0, 0, 63, 72, 0, '2024-10-16 22:00:00', '4032EFFF00A861D673EBE8E8CA4777E4', NULL, '2030-03-03', '0000-00-00', 0, 1, '931239', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, '', 0, 1, 0, 2, 0, 'Nie', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_vehicles`
--

CREATE TABLE `pystories_vehicles` (
  `id` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 411,
  `frozen` int(11) NOT NULL DEFAULT 0,
  `pos` varchar(82) NOT NULL DEFAULT '0, 0, 0, 0, 0, 0',
  `text` text CHARACTER SET utf32 COLLATE utf32_polish_ci NOT NULL,
  `health` int(11) NOT NULL DEFAULT 1000,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `mileage` int(11) NOT NULL DEFAULT 0,
  `driver` text NOT NULL,
  `color` varchar(50) NOT NULL DEFAULT '255, 255, 255',
  `headlights` varchar(41) NOT NULL DEFAULT '255, 255, 255',
  `paintjob` tinyint(1) NOT NULL DEFAULT 3,
  `tuning` text NOT NULL,
  `panelstates` text NOT NULL,
  `rent` varchar(255) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT '0',
  `plateText` text NOT NULL,
  `ownedPlayer` int(11) NOT NULL DEFAULT 0,
  `ownedGroup` varchar(111) NOT NULL,
  `parking` int(11) NOT NULL DEFAULT 0,
  `police` tinyint(2) NOT NULL DEFAULT 0,
  `neon` int(11) NOT NULL DEFAULT 0,
  `blokada` text NOT NULL,
  `registered` varchar(10) NOT NULL DEFAULT 'true',
  `tp_to_parking` varchar(99) DEFAULT NULL,
  `rh` tinyint(1) NOT NULL DEFAULT 0,
  `mk2` tinyint(1) NOT NULL DEFAULT 0,
  `mk1` tinyint(1) NOT NULL DEFAULT 0,
  `chip` int(11) NOT NULL,
  `silnik` text NOT NULL,
  `naped` tinyint(1) NOT NULL DEFAULT 0,
  `engine` text NOT NULL,
  `lpg` int(11) NOT NULL,
  `mk3` int(11) NOT NULL,
  `elektryk` int(11) NOT NULL,
  `fuellpg` int(11) NOT NULL DEFAULT 100,
  `licznik` int(11) NOT NULL,
  `masked` int(11) NOT NULL,
  `opony` int(11) NOT NULL,
  `drift` int(11) NOT NULL,
  `wariant` varchar(16) NOT NULL DEFAULT '255,0',
  `var1` int(11) NOT NULL DEFAULT 255,
  `var2` int(11) NOT NULL DEFAULT 0,
  `mk4` int(11) NOT NULL,
  `deluxomode` int(11) NOT NULL,
  `mrygalki` int(11) NOT NULL,
  `gradient` int(11) NOT NULL,
  `gradientlights` int(11) NOT NULL,
  `taxi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pystories_vehicles`
--

INSERT INTO `pystories_vehicles` (`id`, `model`, `frozen`, `pos`, `text`, `health`, `fuel`, `mileage`, `driver`, `color`, `headlights`, `paintjob`, `tuning`, `panelstates`, `rent`, `plateText`, `ownedPlayer`, `ownedGroup`, `parking`, `police`, `neon`, `blokada`, `registered`, `tp_to_parking`, `rh`, `mk2`, `mk1`, `chip`, `silnik`, `naped`, `engine`, `lpg`, `mk3`, `elektryk`, `fuellpg`, `licznik`, `masked`, `opony`, `drift`, `wariant`, `var1`, `var2`, `mk4`, `deluxomode`, `mrygalki`, `gradient`, `gradientlights`, `taxi`) VALUES
(1, 560, 0, '167.95,-56.18,1.28,0.20,0.27,81.83', '', 1000, 94, 6, '#0000FFMrJooker', '255,255,255,0,0,0,0,0,0,0,0,0', '152,6,3', 3, '1003,1031,1080,1028,1169,1141', '0,0,0,0,0,0,0', '0', '', 2, '', 1, 0, 1, 'false', 'true', 'Schowany recznie(kierowca)', 1, 1, 1, 1, '6.0', 1, '', 1, 1, 1, 100, 0, 0, 0, 1, '1,255', 255, 0, 1, 1, 1, 1, 1, 1),
(2, 526, 0, '167.95,-54.95,1.34,0.20,359.37,267.05', '', 1000, 23, 8672, '#C0FF00devpl', '69,69,69,0,0,0,0,0,0,0,0,0', '255,255,255', 3, '1075', '0,0,0,0,0,0,0', '0', '', 1, '', 1, 0, 0, 'false', '', 'Schowany recznie(kierowca)', 1, 1, 1, 1, 'true', 1, '', 0, 0, 0, 100, 0, 0, 0, 0, '1,1', 255, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pystories_vehicles_parking`
--

CREATE TABLE `pystories_vehicles_parking` (
  `idparking` int(11) NOT NULL,
  `idpojazdu` int(20) NOT NULL,
  `funkcjonariusz` varchar(64) NOT NULL,
  `rejestracja` varchar(20) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `powod` varchar(64) NOT NULL,
  `cena` int(10) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Ranking`
--

CREATE TABLE `Ranking` (
  `uid` bigint(20) NOT NULL,
  `zabojstw` bigint(20) NOT NULL,
  `smierci` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `raps`
--

CREATE TABLE `raps` (
  `nick` text NOT NULL,
  `sid` bigint(20) NOT NULL,
  `ostatnio_zrobil` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wrpg_dconnect`
--

CREATE TABLE `wrpg_dconnect` (
  `did` text NOT NULL,
  `serial` text NOT NULL,
  `sid` int(11) NOT NULL,
  `discord_tag` text NOT NULL,
  `nick_mta` text NOT NULL,
  `avatar` text NOT NULL,
  `booster` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wrpg_dconnect`
--

INSERT INTO `wrpg_dconnect` (`did`, `serial`, `sid`, `discord_tag`, `nick_mta`, `avatar`, `booster`, `data`) VALUES
('986954781480353872', 'FE3B0D7B53ECE36468FF0BBF0B018644', 1, '_devpl_#0', 'devpl', 'https://cdn.discordapp.com/avatars/986954781480353872/a7b5de0df04a0ba60349c778f421e00c.png', 0, '2024-10-17 20:06:12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wrpg_ekipa_discord`
--

CREATE TABLE `wrpg_ekipa_discord` (
  `id_wiadomości` text NOT NULL,
  `id_kanału` text NOT NULL,
  `rola1` text NOT NULL,
  `rola2` text NOT NULL,
  `rola3` text NOT NULL,
  `rola4` text NOT NULL,
  `rola5` text NOT NULL,
  `rola6` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Zawiadomienia`
--

CREATE TABLE `Zawiadomienia` (
  `ID` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `serial` varchar(32) NOT NULL,
  `miejsce` varchar(40) NOT NULL,
  `pozycja` varchar(60) NOT NULL,
  `typ` varchar(24) NOT NULL,
  `odebral` int(11) NOT NULL COMMENT 'sid kto pierwszy dojechał',
  `odebral_data` datetime NOT NULL COMMENT 'kiedy to było'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kody`
--
ALTER TABLE `kody`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ms_organizacje`
--
ALTER TABLE `ms_organizacje`
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `uid_2` (`uid`),
  ADD KEY `code` (`uid`,`actived`);

--
-- Indeksy dla tabeli `ogrpg_jobs`
--
ALTER TABLE `ogrpg_jobs`
  ADD UNIQUE KEY `NULL` (`NULL`),
  ADD KEY `code` (`code`,`uid`,`actived`,`added`),
  ADD KEY `code_2` (`code`);

--
-- Indeksy dla tabeli `ogrpg_office`
--
ALTER TABLE `ogrpg_office`
  ADD PRIMARY KEY (`dodatek`);

--
-- Indeksy dla tabeli `PSP_drzewa`
--
ALTER TABLE `PSP_drzewa`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `pystories_admins`
--
ALTER TABLE `pystories_admins`
  ADD PRIMARY KEY (`osoba`);

--
-- Indeksy dla tabeli `pystories_factions`
--
ALTER TABLE `pystories_factions`
  ADD PRIMARY KEY (`-`),
  ADD KEY `code` (`actived`);

--
-- Indeksy dla tabeli `pystories_importexport`
--
ALTER TABLE `pystories_importexport`
  ADD PRIMARY KEY (`sid`);

--
-- Indeksy dla tabeli `pystories_jobs`
--
ALTER TABLE `pystories_jobs`
  ADD UNIQUE KEY `NULL` (`NULL`),
  ADD KEY `code` (`code`,`uid`,`actived`,`added`),
  ADD KEY `code_2` (`code`);

--
-- Indeksy dla tabeli `pystories_lotto`
--
ALTER TABLE `pystories_lotto`
  ADD PRIMARY KEY (`nr`);

--
-- Indeksy dla tabeli `pystories_office`
--
ALTER TABLE `pystories_office`
  ADD PRIMARY KEY (`-`);

--
-- Indeksy dla tabeli `pystories_punish`
--
ALTER TABLE `pystories_punish`
  ADD PRIMARY KEY (`kolejnosc`);

--
-- Indeksy dla tabeli `pystories_serials`
--
ALTER TABLE `pystories_serials`
  ADD PRIMARY KEY (`-`);

--
-- Indeksy dla tabeli `pystories_stereo`
--
ALTER TABLE `pystories_stereo`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pystories_users`
--
ALTER TABLE `pystories_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pystories_vehicles`
--
ALTER TABLE `pystories_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Zawiadomienia`
--
ALTER TABLE `Zawiadomienia`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kody`
--
ALTER TABLE `kody`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ogrpg_office`
--
ALTER TABLE `ogrpg_office`
  MODIFY `dodatek` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PSP_drzewa`
--
ALTER TABLE `PSP_drzewa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pystories_admins`
--
ALTER TABLE `pystories_admins`
  MODIFY `osoba` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pystories_factions`
--
ALTER TABLE `pystories_factions`
  MODIFY `-` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pystories_lotto`
--
ALTER TABLE `pystories_lotto`
  MODIFY `nr` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pystories_office`
--
ALTER TABLE `pystories_office`
  MODIFY `-` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pystories_punish`
--
ALTER TABLE `pystories_punish`
  MODIFY `kolejnosc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pystories_serials`
--
ALTER TABLE `pystories_serials`
  MODIFY `-` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pystories_stereo`
--
ALTER TABLE `pystories_stereo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pystories_users`
--
ALTER TABLE `pystories_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pystories_vehicles`
--
ALTER TABLE `pystories_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Zawiadomienia`
--
ALTER TABLE `Zawiadomienia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
