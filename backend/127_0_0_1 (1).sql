-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Nov 17. 13:52
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `osztv_adatbazis`
--
CREATE DATABASE IF NOT EXISTS `osztv_adatbazis` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `osztv_adatbazis`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ev`
--

CREATE TABLE `ev` (
  `ev_id` int(11) NOT NULL,
  `ev_szam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `ev`
--

INSERT INTO `ev` (`ev_id`, `ev_szam`) VALUES
(1, 2025),
(2, 2024);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `feladat`
--

CREATE TABLE `feladat` (
  `feladat_id` int(11) NOT NULL,
  `feladat_kerdes` text NOT NULL,
  `feladat_a` varchar(255) NOT NULL,
  `feladat_b` varchar(255) NOT NULL,
  `feladat_c` varchar(255) NOT NULL,
  `feladat_d` varchar(255) NOT NULL,
  `feladat_e` varchar(255) NOT NULL,
  `feladat_f` varchar(255) NOT NULL,
  `feladat_helyes` varchar(255) NOT NULL,
  `feladat_kep` varchar(255) NOT NULL,
  `feladat_ev` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `feladat`
--

INSERT INTO `feladat` (`feladat_id`, `feladat_kerdes`, `feladat_a`, `feladat_b`, `feladat_c`, `feladat_d`, `feladat_e`, `feladat_f`, `feladat_helyes`, `feladat_kep`, `feladat_ev`) VALUES
(1, 'Egy elektromos berendezés kiválasztásánál szükséges lenne tudnunk, hogy mennyi annak \r\na maximális áramfelvétele. Az eszköz 110V -os feszültséget igényel és 22W teljesítményű. \r\nMennyi lesz az áramfelvétel?', '1A', '1mA', '200mA', '100 μA', '', '', 'c', '', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ev`
--
ALTER TABLE `ev`
  ADD PRIMARY KEY (`ev_id`);

--
-- A tábla indexei `feladat`
--
ALTER TABLE `feladat`
  ADD PRIMARY KEY (`feladat_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ev`
--
ALTER TABLE `ev`
  MODIFY `ev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `feladat`
--
ALTER TABLE `feladat`
  MODIFY `feladat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
