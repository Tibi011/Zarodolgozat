-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Feb 20. 08:45
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
  `informacio_tananyag` text NOT NULL,
  `informacio_tema` varchar(255) NOT NULL,
  `informacio_datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `informacio`
--

INSERT INTO `informacio` (`informacio_id`, `informacio_cim`, `informacio_tananyag`, `informacio_tema`, `informacio_datum`) VALUES
(1, 'Adatbázis utasítások', '<div style=\"background-color: white; padding: 20px; margin-bottom: 20px; border-radius: 8px;\">\r\n    <h6 style=\"margin-top: 0;\">1. SELECT</h6>\r\n    <p><strong>Adatok lekérdezésére szolgál egy vagy több táblából.</strong></p>\r\n    <pre style=\"background-color: #eeeeee; padding: 10px; border-radius: 5px;\">\r\nSELECT oszlop1, oszlop2, ...\r\nFROM tabla_nev\r\n[WHERE feltetel]\r\n[GROUP BY oszlop]\r\n[HAVING feltetel]\r\n[ORDER BY oszlop];\r\n    </pre>\r\n</div>\r\n\r\n<div style=\"background-color: white; padding: 20px; margin-bottom: 20px; border-radius: 8px;\">\r\n    <h6 style=\"margin-top: 0;\">2. INSERT</h6>\r\n    <p><strong>Új rekord(ok) beszúrására szolgál a táblába.</strong></p>\r\n    <pre style=\"background-color: #eeeeee; padding: 10px; border-radius: 5px;\">\r\nINSERT INTO tabla_nev (oszlop1, oszlop2, ...)\r\nVALUES (ertek1, ertek2, ...);\r\n    </pre>\r\n</div>\r\n\r\n<div style=\"background-color: white; padding: 20px; margin-bottom: 20px; border-radius: 8px;\">\r\n    <h6 style=\"margin-top: 0;\">3. UPDATE</h6>\r\n    <p><strong>Meglévő rekord(ok) adatainak módosítására szolgál.</strong></p>\r\n    <pre style=\"background-color: #eeeeee; padding: 10px; border-radius: 5px;\">\r\nUPDATE tabla_nev\r\nSET oszlop1 = ertek1, oszlop2 = ertek2, ...\r\n[WHERE feltetel];\r\n    </pre>\r\n</div>\r\n\r\n<div style=\"background-color: white; padding: 20px; border-radius: 8px;\">\r\n    <h6 style=\"margin-top: 0;\">4. DELETE</h6>\r\n    <p><strong>Rekord(ok) törlésére szolgál a táblából.</strong></p>\r\n    <pre style=\"background-color: #eeeeee; padding: 10px; border-radius: 5px;\">\r\nDELETE FROM tabla_nev\r\n[WHERE feltetel];\r\n    </pre>\r\n</div>\r\n', 'Adatbázis kezelés', '2026-02-06'),
(2, 'Adatbázis alapfogalmak', 'Az adatbázis alapfogalmai:\r\n\r\n**1. Mező (attribútum)**\r\nA tábla egy oszlopa. Egy adott tulajdonságot ír le az egyedről (pl. név, életkor, cím). Egy mező azonos típusú adatokat tartalmaz.\r\n\r\n**2. Rekord (sor)**\r\nA tábla egy sora. Egy konkrét egyedhez tartozó összes mezőértéket tartalmazza.\r\n\r\n**3. Egyed (entitás)**\r\nEgy valós vagy elképzelt objektum, amelyről adatokat tárolunk (pl. tanuló, dolgozó, termék). Az egyed adatai rekord formájában jelennek meg a táblában.\r\n\r\n**4. Tábla (reláció)**\r\nAz adatbázis alapvető szerkezeti eleme. Sorokból (rekordokból) és oszlopokból (mezőkből) áll.\r\n\r\n**5. Kapcsolat (reláció egyedek között)**\r\nKét vagy több egyed közötti összefüggés. Általában kulcsok (elsődleges kulcs, idegen kulcs) segítségével valósul meg.\r\nTípusai:\r\n\r\n* egy az egyhez (1:1)\r\n* egy a többhöz (1:N)\r\n* több a többhöz (N:M)\r\n\r\n**6. Elsődleges kulcs (Primary Key)**\r\nOlyan mező vagy mezők kombinációja, amely egyértelműen azonosít egy rekordot a táblában.\r\n\r\n**7. Idegen kulcs (Foreign Key)**\r\nOlyan mező, amely egy másik tábla elsődleges kulcsára hivatkozik, és a táblák közötti kapcsolatot biztosítja.\r\n', 'Adatbázis kezelés', '2026-02-06');

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
