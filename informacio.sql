-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Feb 09. 14:17
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `informacio`
--

CREATE TABLE `informacio` (
  `informacio_id` int(11) NOT NULL,
  `informacio_cim` varchar(255) NOT NULL,
  `informacio_feladat` varchar(255) NOT NULL,
  `informacio_tema` varchar(255) NOT NULL,
  `informacio_datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `informacio`
--

INSERT INTO `informacio` (`informacio_id`, `informacio_cim`, `informacio_feladat`, `informacio_tema`, `informacio_datum`) VALUES
(1, 'Frontend', 'programozás', 'II. Frontend programozás', '2026-02-06'),
(2, 'Szoftverfejlesztés', 'tesztelés', 'IV. Szoftverfejlesztés és -tesztelés', '2026-02-06');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `informacio`
--
ALTER TABLE `informacio`
  ADD PRIMARY KEY (`informacio_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `informacio`
--
ALTER TABLE `informacio`
  MODIFY `informacio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
