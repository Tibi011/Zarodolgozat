-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Feb 20. 09:04
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
-- Tábla szerkezet ehhez a táblához `eredmenyek`
--

CREATE TABLE `eredmenyek` (
  `eredmeny_id` int(11) NOT NULL,
  `szazalek` double NOT NULL,
  `felhasznalo_id` int(11) NOT NULL,
  `datum` datetime NOT NULL,
  `ev_id` int(11) NOT NULL,
  `temakor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `eredmenyek`
--

INSERT INTO `eredmenyek` (`eredmeny_id`, `szazalek`, `felhasznalo_id`, `datum`, `ev_id`, `temakor`) VALUES
(1, 55, 8, '2026-01-27 00:00:00', 1, 0),
(2, 1, 8, '2026-01-27 00:00:00', 1, 0),
(3, 69, 6, '2026-01-27 00:00:00', 1, 0),
(9, 1, 8, '2026-02-03 08:39:58', 1, 0),
(10, 0, 8, '2026-02-17 08:45:46', 1, 0),
(11, 0, 8, '2026-02-17 08:46:02', 1, 0),
(12, 1, 8, '2026-02-17 08:46:26', 1, 0),
(13, 1, 8, '2026-02-17 08:46:47', 1, 0),
(14, 1, 8, '2026-02-19 08:57:07', 1, 0),
(15, 0, 8, '2026-02-19 08:57:29', 1, 0),
(16, 1, 8, '2026-02-19 08:59:34', 2, 0),
(17, 1, 8, '2026-02-19 09:03:03', 2, 0),
(18, 1, 8, '2026-02-19 09:04:55', 1, 0),
(19, 0, 8, '2026-02-19 13:34:07', 1, 0),
(20, 1, 8, '2026-02-19 13:38:24', 1, 0),
(21, 1, 8, '2026-02-19 13:42:20', 1, 0),
(22, 2, 8, '2026-02-19 13:57:50', 1, 0),
(23, 1, 8, '2026-02-19 13:57:59', 4, 0),
(24, 2, 8, '2026-02-19 14:02:09', 0, 1),
(25, 2, 8, '2026-02-19 14:02:19', 0, 1),
(26, 2, 8, '2026-02-19 14:04:24', 0, 3),
(27, 1, 8, '2026-02-19 14:05:36', 0, 4),
(28, 1, 8, '2026-02-20 09:03:24', 2, 0);

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
(2, 2024),
(3, 2023);

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
  `feladat_ev` int(11) NOT NULL,
  `feladat_tema` int(11) NOT NULL,
  `feladat_pont` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `feladat`
--

INSERT INTO `feladat` (`feladat_id`, `feladat_kerdes`, `feladat_a`, `feladat_b`, `feladat_c`, `feladat_d`, `feladat_e`, `feladat_f`, `feladat_helyes`, `feladat_kep`, `feladat_ev`, `feladat_tema`, `feladat_pont`) VALUES
(1, 'Egy elektromos berendezés kiválasztásánál szükséges lenne tudnunk, hogy mennyi annak a maximális áramfelvétele. Az eszköz 110V -os feszültséget igényel és 22W teljesítményű. Mennyi lesz az áramfelvétel?', 'a) 1 A', 'b) 1 mA', 'c) 200 mA', 'd) 100 μA', '', '', 'C', '', 1, 1, 2),
(2, 'Igaz-e a következő állítás? A feszültségmérőt a fogyasztóval sorosan kell bekötni az \náramkörbe.', 'a) A fenti állítás minden esetben hamis.', 'b) A fenti állítás minden esetben igaz.', 'c) A fenti állítás bizonyos esetekben hamis.', 'd) A fenti állítás bizonyos esetekben igaz.', 'e) A rendelkezésre álló adatok alapján nem eldönthető.', '', 'A', '', 1, 1, 2),
(3, 'Melyik alkatrész szolgál egy áramkörben az elektromos energia tárolására?', 'a) tranzisztor', 'b) kondenzátor', 'c) tekercs', 'd) dióda', '', '', 'B', '', 1, 1, 2),
(4, 'Milyen funkciót lát el az ellenállás egy áramkörben?', 'a) Stabilizálja a feszültséget.', 'b) Egyen irányítja  az áramot.', 'c) Tárolja az elektromos töltést.', 'd) Védelmet nyújt a túlfeszültség ellen.', 'e) Csökkenti az áram erősségét.', '', 'E', '', 1, 1, 2),
(5, 'Linus az operációs rendszerét melyik CPU -ra / gépcsaládra készítette el?', 'a) i286', 'b) i386', 'c) Alpha', 'd) Sparc', 'e) AMD', '', 'B', '', 1, 1, 2),
(6, 'Melyik ma is létező és aktívan fejlődő operációs rendszerre hasonlít leginkább a Linux?', 'a) Android', 'b) Linux', 'c) MacOS', 'd) Unix', 'e) Windows', '', 'B,D', '', 1, 1, 2),
(7, 'Melyik operációs rendszert vette alapul Torvalds  a Linux operációs rendszer \nkifejlesztéséhez?', 'a) iOS', 'b) IOS', 'c) MINIX', 'd) Unix', 'e) Windows', '', 'C', '', 1, 1, 2),
(8, 'Torvalds  operációs rendszere esetében melyik komponens felel a hardware elemek \nvezérléséért?', 'a) Kernel', 'b) GUI', 'c) CLI', 'd) Shell', 'e) BASH', '', 'A', '', 1, 1, 2),
(9, 'Egy 32 bites architektúra esetén mekkora a legnagyobb megcímezhető memória mérete?', 'a) 2 GB', 'b) 4 GB', 'c) 8 GB', 'd) 32 GB', 'e) 4 MB', '', 'B', '', 1, 1, 2),
(10, 'Hogy nevezzük a grafikai számításokra kifejlesztett műveletvégző egységet?', 'a) Core', 'b) CPU', 'c) GPU', 'd) Socket', 'e) VRAM', '', 'C', '', 1, 1, 2),
(11, 'Mely típusú csatlakozó nem alkalmas videójel átvitelére az alább felsoroltak közül?', 'a) BNC', 'b) DVI', 'c) HDMI', 'd) PS/2', 'e) RCA', '', 'D', '', 1, 1, 2),
(12, 'Mit jelent a partícionálás egy SSD típusú meghajtó esetében?', 'a) Különálló logikai tárolóegységet hozunk létre a meghajtón.', 'b) Különálló fizikai tárolóegységet hozunk létre a meghajtón.', 'c) Új szilárdtest tárolókat alakítunk ki a meghajtón.', 'd) Az SSD meghajtók fizikai szektorainak manuális átrendezése.', 'e) Az SSD meghajtók esetében nem engedélyezett.', '', 'A', '', 1, 1, 2),
(13, 'Mi a célja a preventív karbantartásnak?', 'a) Az eszközök teljesítményének növelése.', 'b) Az energiafogyasztás csökkentése.', 'c) Az eszközelemek gyorsabb cseréje.', 'd) A karbantartási költségek növelése.', 'e) A rendszerhiba kockázatának csökkentése.', '', 'E', '', 1, 1, 2),
(14, 'Mi a szerepe a por eltávolításának a számítógépek karbantartásában?', 'a) A szoftver teljesítményének javítása.', 'b) Az energiafogyasztás csökkentése.', 'c) A hűtés hatékonyságának fenntartása.', 'd) Az operációs rendszer gyorsítása.', 'e) A számítógép cseréjének elkerülése.', '', 'C', '', 1, 1, 2),
(15, 'Minek a rövidítése az IoT?', 'a) Internet of Things', 'b) Information of Technology', 'c) Information over Tunnel', 'd) Intelligence of Things', 'e) Internet of Technology', '', 'A', '', 1, 1, 2),
(16, 'A TCP/IP modell melyik rétegében működik az Ethernet?', 'a) Internet', 'b) Szállítási', 'c) Hozzáférési', 'd) Alkalmazási', 'e) Protokoll', '', 'C', '', 1, 1, 2),
(17, 'Egy 1  Mbps  átviteli sebességű hálózati kapcsolat 2 perc alatt (maximum) hány bit \nátvitelére képes?', 'a) 960.000.000', 'b) 480.000.000', 'c) 180.000.000', 'd) 120.000.000', 'e) 60.000.000', '', 'D', '', 1, 1, 2),
(18, 'Hány bájtos egy IPv6 -os cím?', 'a) 128', 'b) 48', 'c) 32', 'd) 16', 'e) 4', '', 'D', '', 1, 1, 2),
(19, 'Hogy nevezzük az olyan hálózatot, ahol nincs kitüntetett szerver -kliens szerepkör?', 'a) Point -to-Point', 'b) Point -to-Peer', 'c) Peer-to-Point', 'd) Peer -to-Peer', 'e) Single -to-Single', '', 'D', '', 1, 1, 2),
(20, 'Az alábbiak közül melyik magánhálózati cím az RFC 1918 szabvány szerint?', 'a) 12.212.100.3', 'b) 172.20.100.3', 'c) 172.15.100.3', 'd) 192.200.100.3', 'e) 192.169.100.3', '', 'B', '', 1, 1, 2),
(21, 'Melyik interface  teszi lehetővé egy második  réteg béli  kapcsoló távoli konfigurálását?', 'a) AUX', 'b) SVI', 'c) SVN', 'd) VPN', 'e) WAN', '', 'B', '', 1, 1, 2),
(22, 'Mi az IP címek kiosztásának leggyakoribb módja egy nagyvállalati hálózaton belül?', 'a) Egyetlen központi IP cím használata az egész hálózaton.', 'b) A statikusan beállított IP címek kézzel történő kiosztása.', 'c) Az IP címek Bluetooth -on keresztül történő kiosztása.', 'd) Az IP címek automatikus generálása a végponti eszközökön.', 'e) Automatikus, DHCP kiszolgáló által történő kiosztása.', '', 'E', '', 1, 1, 2),
(23, 'Mit csinál a switch , ha olyan keretet kap, amiben a célállomás MAC címe nem szerepel a \nMAC -cím táblájában?', 'a) Automatikusan hozzáadja a MAC címet a táblához, és továbbítja a keretet.', 'b) Eldobja a kapott keretet, mert nem tud vele mit kezdeni.', 'c) Kiküldi a kapott keretet minden portján  kivéve azt, amin az bejött.', 'd) Egy ARP kérést intéz a MAC cím kiderítésére.', 'e) Kiküldi a kapott keretet minden portján .', '', 'C', '', 1, 1, 2),
(24, 'A távoli felhasználóknak melyik megoldás nyújt biztonságos hozzáférést a céges \nhálózathoz?', 'a) A Virtual Private  Network (VPN) technika használata.', 'b) A cég irodájába telepített - L7-es szinten futó - tűzfal.', 'c) A jelszavak mellett valamelyik MFA technika használata.', 'd) A céges fájlok letöltése és tárolása az otthoni eszközökön.', 'e) A böngésző privát módban történő elindítása.', '', 'A', '', 1, 1, 2),
(25, 'Melyik biztonsági eszköz figyeli és riasztja a hálózati rendszergazdát az esetleges \ntámadásokról?', 'a) DHCP', 'b) DNS', 'c) IDS', 'd) SSL', 'e) VPN', '', 'C', '', 1, 1, 2),
(26, 'Melyik támadás célja, hogy túlterhelje a hálózatot, és elérhetetlenné tegye a \nszolgáltatásokat?', 'a) Adathalászat', 'b) Denial of Service', 'c) Man-in-the-Middle', 'd) Social Engineering', 'e) SQL injection', '', 'B', '', 1, 1, 2),
(27, 'Milyen típusú támadás során küld a támadó nagyszámú kérést a szervernek több \nszámítógépről, amelyek különböző földrajzi helyeken találhatók?', 'a) DNS mérgezés', 'b) DOS támadás', 'c) DDoS  támadás', 'd) Ping of Death', 'e) SYN elárasztás', '', 'C', '', 1, 1, 2),
(28, 'A felhőszolgáltatások típusai közül melyik az, amely a legalacsonyabb szolgáltatási szintet \nbiztosítja?', 'a) IaaS', 'b) MaaS', 'c) PaaS', 'd) RaaS', 'e) SaaS', '', 'A', '', 1, 1, 2),
(29, 'Hogy nevezzük a virtuális számítógépek futtatását végző programokat?', 'a) Desktop', 'b) Guest', 'c) Host', 'd) Hypervisor', 'e) Server', '', 'D', '', 1, 1, 2),
(30, 'Milyen felhőalapú megoldást választana, ha a lehető legrövidebb idő alatt szeretne \ninternetről elérhető tárhelyhez jutni?', 'a) SaaS', 'b) PaaS', 'c) IaaS', 'd) SaaR', 'e) SaaM', '', 'A', '', 1, 1, 2),
(31, 'Kinek a nevéhez köthető a HTML nyelv alapjainak kidolgozása?', 'a) Tim Berners -Lee (CERN)', 'b) Steve Jobs (Apple)', 'c) Bill Gates (Microsoft)', 'd) Larry Page (Google)', 'e) Linus Torvalds (Linux Foundation )', '', 'A', '', 1, 2, 3),
(32, 'Melyik évtizedben született meg a  HTML nyelv?', 'a) 1960 -es évek – DARPA, ARPANET', 'b) 1970 -es évek – internet, TCP/IP', 'c) 1980 -as évek  – PC elterjedése', 'd) 1990 -es évek – világháló', 'e) 2000 -es évek – dotcom boom', '', 'D', '', 1, 2, 3),
(33, 'A \"böngészőháború\"  végére az Internet Explorer v ált a  domináns alkalmazás sá. Melyik \nböngésző  vesztette  el a piaci részesedését , és vált mára  szinte ismeretlenné ?', 'a) Apple Safari', 'b) Mozilla Firefox', 'c) Netscape Nagivator', 'd) Microsoft Edge', 'e) Opera', '', 'C', '', 1, 2, 3),
(34, 'A jelenlegi HTML5 az úgynevezett \" Living Standard \" része. Mikorra várható a \nkövetkező nagy kiadás a, esetleg ismert -e már annak a fantázia neve?', 'a) Az 5. 3 verziót  már m ost is használ juk, a Bootstrap számozását követi', 'b) A HTML6 határozatlan időre csúszik az AI technológiák miatt', 'c) Az új verzió neve PHTM L lesz, jelentése Python/PHP + HTML', 'd) A folyamatosan bővülő szabványnak  nem lesz több nagyverzió ja', '', '', 'D', '', 1, 2, 3),
(35, 'Melyik HTML5 -ben bevezetett szemantikus elemmel jelölhetjük az oldal fő tartalmát, \namely a dokumentum legfontosabb része?', 'a) < body  >', 'b) < main  >', 'c) < section class  = \"main\"  >', 'd) < div id  = \"content\"  >', '', '', 'B', '', 1, 2, 3),
(36, 'Egy szövegrészlet félkövér megjelenítésére néhány fejlesztő a <  b > taget, mások a \n< strong  > elemet használják. Valójában mi a különbség a két címke között?', 'a) Korábban volt köztük különbség, de ma már nincs jelentősége.', 'b) A < b > elem már nem szabványos, bár böngészők még támogatják', 'c) A < strong  > vizuális megjelenítésen túl szemantikai jelentéssel bír', 'd) A < strong  > csak a kód olvashatóságát javítja, mert nem rövidítés', 'e) A < strong  > elemmel tehetünk vastagabbá már félkövér <  b > elemet', '', 'C', '', 1, 2, 3),
(37, 'Milyen tag jelöli egy táblázat egyetlen fejléc celláját?', 'a) < head  >', 'b) < header  >', 'c) < thead  >', 'd) < th >', 'e) < td >', '', 'D', '', 1, 2, 3),
(38, 'Hogyan hozható létre hivatkozás az oldal „forrasok ” azonosítójú eleméhez?', 'a) < link href  = \"#forrasok\"  >', 'b) < link id  = \"forrasok\"  >', 'c) < href id  = \"forrasok\"  >', 'd) < a href  = \"forrasok\"  >', 'e) < a href  = \"#forrasok\"  >', '', 'E', '', 1, 2, 3),
(39, 'A <select>  választólistához milyen HTML taggel rendelhető választási lehetőségek ?', 'a) < label  >', 'b) < choice  >', 'c) < option  >', 'd) < input  >', 'e) < value  >', '', 'C', '', 1, 2, 3),
(40, 'Melyik szelektor színezi pirosra kizárólag a menüsorban szereplő hivatkozásokat?', 'a) a:nav { color: red; }', 'b) nav:a { color: red; }', 'c) nav a { color: red; }', 'd) nav.a { color: red; }', 'e) a.nav { color: red; }', '', 'C', '', 1, 2, 3),
(41, 'Hogyan  tudunk egy weboldal on minden  szöveget  Verdana  betűtípus úra állítani ?', 'a) html { font  : Verdana; }', 'b) html { text : Verdana; }', 'c) font { family  : Verdana; }', 'd) body { font -text : Verdana; }', 'e) body { font -family  : Verdana; }', '', 'E', '', 1, 2, 3),
(42, 'Melyik CSS szelektorr al tudunk kiválasztani egy olyan „div” elemet, ami rendelkezik  \n„mandatory ” osztállyal és „gdpr ” azonosító val?', 'a) div.mandatory #gdpr', 'b) div#mandatory .gdpr', 'c) div { .mandatory  { #gdpr {  … } } }', 'd) div { #mandatory  { .gdpr { … } } }', 'e) div class=\" mandatory \" id=\"gdp r\"', '', 'A', '', 1, 2, 3),
(43, 'Számos előnye lehet a Bootstrap keretrendszer CDN -en (Content Delivery Network ) \nkeresztül történő használatának. Az alábbiak közül melyik válasz téves ?', 'a) Csökkenthető  a hálózati forgalom a cache használata miatt', 'b) Általában alacsonyabb a válaszidő a közelebbi szervertől', 'c) Automatikus an hozzá férhetünk a legfrissebb verzióhoz', 'd) A gyorsítótár kihasználása javítja a betöltési időt', '', '', 'C', '', 1, 2, 3),
(44, 'A gutter  osztályt a Bootstrap 5.0 verziójában vezették be. De a s zintaktik ája hasonló a \nmargin vagy padding  osztály éhoz. Hogyan tudunk 5 egységnyi guttert  beállítani?', 'a) style  = \"gutter  : 5px;\"', 'b) . gutter { 5em  ; }', 'c) class  = \"gutter -5\"', 'd) class  = \"g-5\"', '', '', 'D', '', 1, 2, 3),
(45, 'Mi a szerepe  egy HTML oldalon a meta  tagbe n elhelyezett viewport  beállításnak ?', 'a) a reszponzív Bootstrap Rács  / Grid  csak így tud működni', 'b) az oldal  méretezés ért felel  különböző felbontású eszközökön', 'c) megállapítja, hogy az eszköz álló vagy fekvő elrendezésű', 'd) a keresőmotorok nál jobb rangsorolásá t biztosít', 'e) az oldal betűméreté t automatikus méretez i', '', 'B', '', 1, 2, 3),
(46, 'Milyen kódot nem  írhatunk JavaScriptben?', 'a) kliens oldalit', 'b) szerver oldalit', 'c) alacsony szintűt', 'd) magas szintűt', 'e) objektum -orientáltat', '', 'C', '', 1, 2, 3),
(47, 'Hogyan nevezzük a weboldal struktúráját reprezentáló  programozható modellt, ami \nlehetővé teszi szkriptek számára az oldal  elemeinek  elérését és módosítását?', 'a) AOM ( Application  Object  Model )', 'b) BOM ( Browser  Object Model)', 'c) COM ( Content Object Model )', 'd) DOM ( Document Object Model )', 'e) EOM (Element Object Model)', '', 'D', '', 1, 2, 3),
(48, 'Mi az az „ECMA Script ”, és mért jelentős az  ES6 verzió ja?', 'a) A JavaScript szabványa, a modern nyelvi elemek bevezetés ének kezdete', 'b) A JavaScript őse , ebből és a Java szavak  ötvözetéből származik a név', 'c) A JavaScript  következő verziója , ami t 2026-ra terveznek bevezetni', 'd) Egy frontend keretrendszer , ami a 6-os verzió óta piacvezető', 'e) Egy f rontend fejlesztő könyvtár , ami a 6 -os verzió óta piacvezető', '', 'A', '', 1, 2, 3),
(49, 'Melyik igaz a JavaScript változók típus osságára ?', 'a) szigorú  és statikus (fordítás kor kell meghatározni  és nem változhat )', 'b) gyeng e és dinamikus ( futási időben  az aktuálisan  tárolt  értéktől függ)', 'c) típusmentes (nincs jelentősége a változóban tárolt érték típusának)', 'd) multitípusos ( a tárolt értéknek  egyszerre  többféle  típusa  is lehet)', 'e) objektum -orientált ( a típusok valójában osztályok példányai)', '', 'B', '', 1, 2, 3),
(50, 'Melyik kulcsszó vezet be olyan változót, ami már a deklarációja előtt is használható \n(hoisting) , később is szabadon újra deklarálható,  és akár globális hatókörű  is lehet ?', 'a) let', 'b) var', 'c) const', 'd) Ez mindhárom kulcs szóra igaz', 'e) Semelyik nem  tudja ezeket együtt', '', 'B', '', 1, 2, 3),
(51, 'Melyik JavaScript metódus ad vissza  egy új tömböt az eredeti  változtatása nélkül ?', 'a) tomb . filter  ( )', 'b) tomb  . peek  ( )', 'c) tomb  . sort ( )', 'd) tomb  . clone  ( )', '', '', 'A', '', 1, 2, 3),
(52, 'Melyik JavaScriptben létező metódus sal szúrhatunk  be új elemet a tömb elejére ?', 'a) . insert  ( 0 , érték )', 'b) . push ( 0 , érték )', 'c) . append ( érték )', 'd) . unshift  ( érték )', '', '', 'D', '', 1, 2, 3),
(53, 'Milyen formátum ot ellenőrzi ez a reguláris kifejezés: ^[1-9][0-9]{2} [0 -9]{3} d{3}$', 'a) Telefonszám ot (061 234 567)', 'b) TAJ szám ot (123 456 789)', 'c) Személyiszám ot (123 456 AB)', 'd) Bankszámla számot  (1111  2222 opcionális 3333 4444)', '', '', 'B', '', 1, 2, 3),
(54, 'Mi lesz egy  „ for ... of ” ciklus eredménye a book  objektum bejárásakor ?', 'a) Típus hiba, mert az objektum nem iteráltható', 'b) Kulcs-érték pár ok ( \"year\" : 2024  )', 'c) Az objektum kulcsai  ( \"year\" )', 'd) Az objektum é rtékei ( 2024  )', '', '', 'A', '2025_24.png', 1, 2, 3),
(55, 'Mi lesz egy „ for  ... in ” ciklus eredménye a user objektum bejárásakor?', 'a) Undefined  értéke k, mert nem tud objektumot iterálni', 'b) Kulcs-érték pár ok ( \'id\' : 2024 )', 'c) Az objektum kulcsai ( \'id\' )', 'd) Az objektum értékei ( 2024 )', '', '', 'C', '2025_25.png', 1, 2, 3),
(56, 'Hogyan  iratkozhatunk fel egy „handler”  nevű függvénnyel arra  eseményre,  amit az  \noldal teljes tarta lmának betöl tése után vált ki az ablak ?', 'a) window . addEventListener ( \'on Loaded \' , handler  )', 'b) window . addEventListener ( \'load\' , handler )', 'c) window . load ed = handler', 'd) window . isReady  = handler', '', '', 'B', '', 1, 2, 3),
(57, 'Mire  használ juk a Promise  objektumot?', 'a) Ennek  segítségével  tudjuk elkerülni az aszinkron működést', 'b) A használatával kezelhetjük az async  kulcsszó kivételeit', 'c) Ezzel reprezentáljuk  egy jövőbeni művelet eredményé t', 'd) Egy aszinkron  függvénynek lehet vele paramétert átadni', '', '', 'C', '', 1, 2, 3),
(58, 'Melyik függvény  hívás ával tudunk egy szerverhez kérést intézni ?', 'a) http ( url )', 'b) get ( url )', 'c) fetch ( url )', 'd) request ( url )', 'e) response ( url )', '', 'C', '', 1, 2, 3),
(59, 'Milyen programozás i felületet használ egy alkalmazás ahhoz, hogy HTTP üzeneteken  \nkeresztül kérjen  adatot egy másik webes szolgáltatás tól?', 'a) SSH', 'b) SQL', 'c) CLI', 'd) GUI', 'e) API', '', 'E', '', 1, 2, 3),
(60, 'Melyik  nem egy tartalomkezelő -rendszer  (Content Management System / CMS )?', 'a) WordPress', 'b) Joomla !', 'c) Drupal', 'd) Ajax', 'e) SquareSpace', '', 'D', '', 1, 2, 3),
(61, 'Melyik  eszköz való  adatbázis ok tervezésének korai szakaszában  az objektumok  és \nkapcsolat aik vizuális ábrázolására , az implementációs megszorítások nélkül.', 'a) Struktogram', 'b) Relációs adatmodell', 'c) Entity Relationship  model l', 'd) Gantt-diagram', 'e) Venn -diagram', '', 'C', '', 1, 3, 3),
(62, 'Az alábbiak közül melyik  adatbázis -kezelő rendszer nem használ relációs modellt ?', 'a) MongoDB', 'b) MariaDB', 'c) MySQL', 'd) PostgreSQL', 'e) SQLite', '', 'A', '', 1, 3, 3),
(63, 'Hogyan adható meg egy adatbázis létrehozásakor, hogy a szövegek rendezése a magyar \nnyelv szabályait kövesse a kis - és nagybetűk mellőzésével?', 'a) ... CHARSET \'utf8\' LANG \'hu\' COLLATE \'ci\'', 'b) ... CHARSET \'utf8\' LANG \'hungarian\' CI', 'c) ... COLLATE \'utf8_hungarian\' NOT SENSITIVE', 'd) ... COLLATE \'utf8_hungarian_ci\'', '', '', 'D', '', 1, 3, 3),
(64, 'Mi a különbség a PRIMARY KEY és a UNIQUE megszorítások között?', 'a) Az egyik egy MySQL  megkötés,  a másik az MS SQL  megfelelője', 'b) A PRIMARY KEY nem kell, hogy egyedi legyen', 'c) A PRIMARY KEY nem lehet másik táblában idegen kulcs', 'd) A UNIQ UE mező k kitöltése nem kötelező', 'e) A UNIQ UE értékek nem kerülnek indexelésre', '', 'D', '', 1, 3, 3),
(65, 'Melyik D DL utasítással tudunk egy tábla szerkezetén módosítani?', 'a) UPDATE', 'b) ALTER', 'c) MODIFY', 'd) CREATE', 'e) TRUNCAT', '', 'B', '', 1, 3, 3),
(66, 'Melyik adattípus alkalmas nagy mennyiségű szöveg tárolására  a legtöbb SQL \nrendszerben?  (például legfeljebb 100.000 karakter hosszú blog  bejegyzés re)', 'a) BLOB', 'b) CHAR ( 100 .000 )', 'c) VARCHAR  ( 100 .000 )', 'd) TEXT', 'e) STRING', '', 'D', '', 1, 3, 3),
(67, 'Mihez nem adhatunk  álnevet ( alias )?', 'a) Egy adatbázis nak', 'b) Egy táblá nak', 'c) Egy mezőnek', 'd) Egy lekérdezésnek', 'e) Egy számítás eredményének', '', 'A', '', 1, 3, 3),
(68, 'Hogyan lehet  egy lekérdezett  mező értékéhez szöveget hozzáfűzni? ( Például a mérések \ntáblá ban a  távolság oszlop értékéhez a kilométer mértékegységet)', 'a) SELECT tavolsag  + \"km\" FROM meresek', 'b) SELECT \"{ tavolsag} km\" FROM meresek', 'c) SELECT JOIN ( tavolsag  , \"km\" )  FROM meresek', 'd) SELECT CONCAT ( tavolsag  , \"km\" )  FROM meresek', 'e) SELECT tavolsag  APPEND \"km\"  FROM meresek', '', 'D', '', 1, 3, 3),
(69, 'Hogyan  szűrhetünk a versenyzők között az első és második helyez ettekre ?', 'a) ... WHERE helyezes = 1 AND helyezes =  2', 'b) ... WHERE helyezes = 1 AND 2', 'c) ... WHERE helyezes = 1 OR 2', 'd) ... WHERE helyezes BEWEEN 0 AND 3', 'e) ... WHERE helyezes IN (1, 2)', '', 'E', '', 1, 3, 3),
(70, 'Melyik kulcsszó szűri ki egy mező ismétlődő értékeit a lekérdezés eredményéből ?', 'a) UNIQUE', 'b) DISTINC T', 'c) INDEX', 'd) NO REPEAT', 'e) NO DUPLICATE', '', 'B', '', 1, 3, 3),
(71, 'Milyen kifejezést kell írni a [ pattern  ] helyére, hogy  az összes olyan szakm a megnevezése \njelenjen meg a lekérdezésben, ami a „ tesztelő” szóra végződik?  \nSELECT * FROM szakmak WHERE megnevezes LIKE \" [ pattern ] \"', 'a) . tesztel ő', 'b) _ tesztelő', 'c) % tesztel ő', 'd) ? tesztel ő', 'e) * tesztel ő', '', 'C', '', 1, 3, 3),
(72, 'Melyik kifejezés  ellenőr izni, hogy egy mező  értéke  kitöltetlen?', 'a) IS EMPTY', 'b) NOT EMPTY', 'c) IS NULL', 'd) NOT NULL', 'e) IS NULL OR EMPTY', '', 'C', '', 1, 3, 3),
(73, 'Csoportosítás után milyen záradékkal tudunk tovább i szűrési feltételeket megadni ?', 'a) WHERE', 'b) FILTER', 'c) HAVING', 'd) GROUP BY', 'e) ORDER BY', '', 'C', '', 1, 3, 3),
(74, 'Melyik záradékkal lehet befolyásolni a megjelenített rekordok számát ?', 'a) LIMIT', 'b) MAX', 'c) TAKE', 'd) SKIP', 'e) OFFSET', '', 'A', '', 1, 3, 3),
(75, 'Melyik SQL JOIN típus választja ki azokat a rekordokat, amelyek mindkét táblában \nmegfelelnek a csatlakozási feltételnek?', 'a) FULL JOIN', 'b) LEFT JOIN', 'c) OUTER JOIN', 'd) INNER JOIN', 'e) CROSS JOIN', '', 'D', '', 1, 3, 3),
(76, 'Melyik  tervezési mintát alkalmazzuk, amikor  az alkalmazás  felépítését  a következő  \nrétegekre  osztjuk : Megjelenítés ↔ Vezérlő logika ↔ Adatállapotok', 'a) MVC', 'b) MVVM', 'c) REST', 'd) SOLID', 'e) SPA', '', 'A', '', 1, 3, 3),
(77, 'Egy rétegelt felépítésű alkalmazásban általában mi a „controller ” feladat a?', 'a) az alkalmazás adat ainak tárolása, módosítása,  kezel ése', 'b) a felhasználói felület megjelenítés e és elrendezése', 'c) az adatbáziskapcsolat és hálózati kommunikáció  fenntartása', 'd) a felhasználó által kezdeményezett műveletetek  fogadása és kezelése', 'e) az adatok ellenőrzése, a jogosultságok kezelése, naplózás', '', 'D', '', 1, 3, 3),
(78, 'Mi nem tartozik a „ ViewModel ” feladatai közé?', 'a) A megjelenítés t egyszerűsí ti, az adatkötés támogat ja', 'b) Események et és parancsok at közvetíti két réteg között', 'c) A tesztelhetőség  elősegítése , függetlenség  a megjelenítéstől', 'd) Egyetlen osztályba olvasztja a View és a Modell szerepeit', '', '', 'D', '', 1, 3, 3),
(79, 'Az alábbiak közül melyik nem backend fejlesztéséhez  használt  csomagkezelő ?', 'a) Npm  (Node .js)', 'b) Composer  (PHP)', 'c) NuGet (.NET)', 'd) jQuery  (JavaScript )', 'e) Gradle  (Java)', '', 'D', '', 1, 3, 3),
(80, 'Melyik nem egy HTTP kéréstípus?', 'a) GET', 'b) POST', 'c) PUT', 'd) UPDATE', 'e) DELETE', '', 'D', '', 1, 3, 3),
(81, 'Melyik nem egy HTTP válaszkód?', 'a) 604 Index Out of Range', 'b) 502 Bad Gateway', 'c) 418 I’m a teapot', 'd) 307 Temporary Redirect', 'e) 200 OK', '', 'A', '', 1, 3, 3),
(82, 'Mit nem tartalmaznak  egy HTTP kérés fejlé c információi ?', 'a) A kliensalkalmazás  adatait  (User -Agent: Mozilla/5.0 )', 'b) A kliens által preferált nyelveket (Accept -Language: hu -HU)', 'c) A kérés törzsének formátum át (Content -Type: application/json )', 'd) A HTTP metódus t és az URL -t (GET /index.html HTTP/1.1 )', 'e) A szervernek küldött cookie -kat (Cookie: sessionId= abc123)', '', 'D', '', 1, 3, 3),
(83, 'Melyik fogalom nem tartozik az CRUD műveletek közé?', 'a) adatok létrehozása', 'b) adatok ellenőrzése', 'c) adatok megtekintése', 'd) adatok módosítása', 'e) adatok eltávolítása', '', 'B', '', 1, 3, 3),
(84, 'Hogyan tárolja a REST kialakítású szerver a korábbi kérések állapotát?', 'a) cookie  fájlokban', 'b) session segítségével', 'c) socket  használatával', 'd) sehogyan, nem tárolja ezeket', '', '', 'D', '', 1, 3, 3),
(85, 'Melyik a javasolt  URL felépítés egy REST ful felület tervezésekor , ha a végpont tól \nkülönböző évek ben szervezett  versenyek indulóinak  eredmény ét kérhetjük el?', 'a) / getEredmeny  / 2025 / getVersenyzo  / 1', 'b) / eredmeny  / 2025  / versenyzo  / 1', 'c) / eredmeny  / ? ev = 2025  & id = 1', 'd) / getVersenyzoEredmeny  ? ev = 2025  & id = 1', '', '', 'B', '', 1, 3, 3),
(86, 'Melyik a legelterjedtebb leíró formátum webszolgáltatások között, ami mélyen \nstrukturált adatok tárolására képes könnyen olvasható alakban?', 'a) Markdown', 'b) XHTML', 'c) XAML', 'd) JSON', 'e) CSV', '', 'D', '', 1, 3, 3),
(87, 'Az ORM egy réteg et képez  az objektumorientált program és a relációs adatbázis között , \namivel hatékonyabbá válthat a fejlesztés . Melyik nem tartozik a z előnyei közé?', 'a) elfedi az eltérő adatbázis -kezelő rendszerek különbségeit', 'b) a táblá kat osztályokká  képezi le', 'c) képest kezel ni az osztályok között i 1:1, 1:N, N:N kapcsolatot', 'd) SQL utasítás ok kiváltható k példányok manipulálásával', 'e) garantálja  bonyolult  lekérdezések  optimális  futtatását', '', 'E', '', 1, 3, 3),
(88, 'Melyik nem egy ORM keretrendszer ?', 'a) Entity Framework (C# .NET)', 'b) Java Persistence API  (Java)', 'c) Postman ( REST API)', 'd) Eloquent (PHP, Laravel)', 'e) Sequelize  (Node.js)', '', 'C', '', 1, 3, 3),
(89, 'Hogyan nevezzük a technikát, amikor egy osztály függőségeit a konstruktor on keresztül \nadjuk át ? Például: public FelhasználóKezelő(IDatabase context) { }', 'a) Dependency Injection', 'b) SQL Injection', 'c) SQL Separation', 'd) Interface Implementation', 'e) Interface Inversion', '', 'A', '', 1, 3, 3),
(90, 'Mi az  az eszköz, am i automatikusan biztosítja egy objektum függősége it, amikor arra \nszükség van? Például : IDataBase  context  = Services.Resolve<IDataBase>();', 'a) Singleton', 'b) SQL Injector', 'c) Factory Pattern', 'd) IoC Container', '', '', 'D', '', 1, 3, 3),
(91, 'A Git alkotója az elnevezést a brit szlengből kölcsönözte. Önironikus utalásnak szánta \nsaját magára, mint csökönyös, rossz modorú emberre. Ki volt ő és milyen forráskód \nhatékonyabb kezelésére dolgozta ki?', 'a) Steve Jobs (Apple iOS)', 'b) Bill Gates (Microsoft Windows)', 'c) Linus Torvalds (Linux kernel)', 'd) Mark Zuckerberg (Facebook)', '', '', 'C', '', 1, 4, 2),
(92, 'Hogyan nevezzük azt a felépítést, amiben minden fejlesztő rendelkezik a projekt teljes \nállapotával, de egy központi szolgáltatón keresztül szinkronizálni is tudják a \nváltozásokat?', 'a) elosztott rendszer', 'b) centralizált rendszer', 'c) decentralizált rendszer', 'd) peer-to-peer rendszer', '', '', 'A', '', 1, 4, 2),
(93, '„Commit”  készítéséhez milyen adatok beállítása kötelező?', 'a) Username és Password', 'b) Username és Email', 'c) Personal Access Token', 'd) GitHub Account', '', '', 'B', '', 1, 4, 2),
(94, 'A fájlok fizikai tárolása szerint egy Git „repository” milyen két típusú lehet?', 'a) main / branch', 'b) public / private', 'c) local / remote', 'd) staged / unstaged', 'e) tracked / untracked', '', 'C', '', 1, 4, 2),
(95, 'Mivel azonosítja a Git rendszere a projekt egy adott pillanatban vett állapotát?', 'a) Timestamp', 'b) GUID', 'c) URI', 'd) URL', 'e) Hash', '', 'E', '', 1, 4, 2),
(96, 'Melyik utasítással tölthetők fel a helyi adattár bejegyzései egy távoli szolgáltatóhoz?', 'a) update', 'b) refresh', 'c) upload', 'd) push', 'e) pull', '', 'D', '', 1, 4, 2),
(97, 'Lehetséges -e klónozni egy idegen fejlesztő GitHubon található publikus projektjét?', 'a) Nem, de a fájlokat le lehet tölteni.', 'b) Igen, de csak ha meghívott kollaborációra.', 'c) Igen, ha van saját GitHub fiókunk.', 'd) Megkötések nélkül van rá lehetőség.', '', '', 'D', '', 1, 4, 2),
(98, 'Mi a „branch” szerepe  a fejlesztési folyamatban?', 'a) Nem tudnak konfliktusok kialakulni a verziók között.', 'b) Elősegíti a párhuzamos fejlesztést és a csapatmunkát.', 'c) A fejlesztők közös verzión dolgozhatnak egy időben.', 'd) Lehetővé teszi egy -egy fejlesztőnek az offline munkát.', '', '', 'B', '', 1, 4, 2),
(99, 'Hogyan nevezzük az eltérő ágak egyesítését, mindkét ág teljes történetének \nmegtartásával?', 'a) checkout', 'b) merge', 'c) sync', 'd) join', '', '', 'B', '', 1, 4, 2),
(100, 'Mi a célja GitHub platformon egy „ pull request ” küldésének?', 'a) A jogosultságok ellenőrzése változások letöltése nélkül.', 'b) A fejlesztőket szólíthatjuk fel a kódjuk feltöltésére.', 'c) A fejlesztőket szólíthatjuk fel az új verzió letöltésére.', 'd) A respository  tulajdonosa küldhet módosítási kérést fejlesztőknek.', 'e) A respository tulajdonosának küldhetünk módosítási javaslatot .', '', 'E', '', 1, 4, 2),
(101, 'Melyik az alábbiak közül a projektmenedzsment három legfontosabb eleme?', 'a) Idő - Költség - Terjedelem', 'b) Idő - Költség - Minőség', 'c) Kockázat - Kommunikáció - Motiváció', 'd) Képzés - Kommunikáció - Költség', 'e) Idő - Minőség - Erőforrás', '', 'A,B', '', 1, 4, 2),
(102, 'Melyik nem egy projekt jellemzője?', 'a) célhoz kötött', 'b) komplex', 'c) automatikus', 'd) tervezett', 'e) változó', '', 'C', '', 1, 4, 2),
(103, 'Mi a projekt életciklusának második szakasza?', 'a) Végrehajtás', 'b) Ellenőrzés', 'c) Tervezés', 'd) Lezárás', 'e) Indítás', '', 'C,E', '', 1, 4, 2),
(104, 'Projektmenedzsment során milyen diagramot használunk a tevékenységek időbeli \ntervezésére?', 'a) Oszlop diagram', 'b) Gantt diagram', 'c) Sávos diagram', 'd) Torta diagram', 'e) Idő diagram', '', 'B', '', 1, 4, 2),
(105, 'Melyik eszköz használható egy Kanban tábla egyszerű kezelésére és vizuális \nmegjelenítésére?', 'a) Jira', 'b) Figma', 'c) Teams', 'd) Trello', 'e) GitHub', '', 'A,D', '', 1, 4, 2),
(106, 'Mit érdemes választani , mint megvalósítandó teszt cél ?', 'a) A rendszer m ár készítés közben is teljesen hibamentes legyen .', 'b) A rendszer az  éles indításkor teljesen hibamentes legyen .', 'c) Növeljük a megbízhatóságot, csökkentsük a kockázatot .', 'd) Ne legyenek teszteletlen bemenetek .', 'e) Ne legyenek teszteletlen kimenetek .', '', 'C', '', 1, 4, 2),
(107, 'Milyen okból mondhatjuk azt, hogy egy teszt „elkopott”?', 'a) Nem fut automatikusan, például  elavult  a keretrendszer .', 'b) Az eredeti célja már nem felel meg az aktuális kódbázisnak.', 'c) Nem dokumentálták megfelelően, idővel nem érthető, mit vizsgál .', 'd) A régóta nem futtatott teszteket  ignorálja a kere trendszer .', '', '', 'B', '', 1, 4, 2),
(108, 'Miért fontos felismerni a hibafürtök jelenségét?', 'a) Ezek azok a területek, ahol az automatikus tesztelés nem hatékony.', 'b) Egy adott modul hibái lokalizáltak maradnak, és nem terjednek tovább.', 'c) A hibák gyakran ugyan azon  a területen  halmozódnak.', 'd) A sok egységteszt  magától értetődően több hibát  mutat ki .', '', '', 'C', '', 1, 4, 2),
(109, 'Miért állítják  azt, hogy kimerítő teszt a valóságban nem lehetséges?', 'a) Túl sok  idő és erőforrás  lenne az összes esetet lefedni .', 'b) A tesztelési eszközök képtelenek  minden hibát feltárni.', 'c) A tesztkészletek nem frissülnek elég gyorsan a kód változásaihoz.', 'd) A tesztelés  dokumentá ciójába n is bármikor  előfordulhat  hiba.', '', '', 'A', '', 1, 4, 2),
(110, 'Melyik  tervezési modell nem tartalmazza egyáltalán a tesztelést, mint a szoftverfejlesztés \néletciklus ának  egy tevékenység ét?', 'a) szekvenciális  modellek  (pl. V-modell )', 'b) iteratív  modellek  (pl. Prototípus )', 'c) inkrementális  modellek  (pl. Scrum )', 'd) a fentiek közül egyik sem  tartalmazza', 'e) a fentiek közül mindegyik  tartalmazza', '', 'E', '', 1, 4, 2),
(111, 'Az agilis módszertanok és a DevOps  elterjedésével vált egyre inkább  elterjedté a  „shift -\nleft”  megközelítés . Mire helyezi ez a hangsúlyt?', 'a) A korai tesztelés  kerülendő, mert  lassítja a fejlesztők munkáját .', 'b) A hibák korai felismerés ét és megelőzés ét helyezi előtérbe .', 'c) Fejlesztők helyett dedikált  a tesztelők végzik a z ellenőrzését.', 'd) Dedikált tesztelők helyett maguk fejlesztők végzik  a tesztelést .', 'e) A tesztelést a megrendelő bevonásával kell végezni.', '', 'B', '', 1, 4, 2),
(112, 'Mit nevezünk  „statikus ” tesztelés nek? A kód tesztelését...', 'a) adatbázis -kapcsolat nélkül', 'b) megjelenítés i réteg  nélkül', 'c) a kód futtatás a nélkül', 'd) fordítás i környezet  nélkül', 'e) szintaktikai elemzés nélkül', '', 'C', '', 1, 4, 2),
(113, 'Mit tesztelünk „egységtesztek” során?', 'a) A teljes alkalmazást egyetlen osztatlan egységként  kezelve .', 'b) A legnagyobb egysége ket elkülönítve  (View , Logic , Model , stb.).', 'c) Az eltérő modulegységek együttműködését .', 'd) Osztályok függvényeit  és metódusait  izolált an.', 'e) Osztályok függőségeit .', '', 'D', '', 1, 4, 2),
(114, 'Mit vizsgálunk  „integrációs” tesztek  során ?', 'a) Egy függvény minden beme netre helyes eredmény ad.', 'b) Egy osztály megvalósít ja az összes  elvárt funkció ját.', 'c) Egy komponens helyesen működik más rendszerelemekkel .', 'd) Az alkalmazás  teljesíti  a felhasználói igényeket.', '', '', 'C', '', 1, 4, 2),
(115, 'Mire utal a tesztpiramisban a 10% -20% -70% -os „ökölszabály”?', 'a) A csapat összetételére (menedzser, tesztelő, fejlesztő)', 'b) Az időráfordításra (dokumentáció, tesztelés, fejlesztés)', 'c) Az időbeli ráfordításra (tervezés, tesztelés , implementáció )', 'd) A teszttípusok arányára ( rendszer , integrációs, egységteszt)', '', '', 'D', '', 1, 4, 2),
(116, 'Igaz-e a kijelentés , hogy a manuális tesztelést teljesen ki kell iktatni a modern \nszoftverfejlesztés  folyamatából ?', 'a) Igen, mert az automatizálás hatékonyabb és pontosabb .', 'b) Igen, mert csak emberi hibákat eredményez, így nincs valódi értéke.', 'c) Nem, de kizárólag kis projektek esetében van helye manuális tesztelésnek.', 'd) Nem, például a felhasználói élmény vizsgálatánál elengedhetetlen.', 'e) Nem, a manuális teszt a kreatív hibakeresési módszerek alapja.', '', 'D', '', 1, 4, 2),
(117, 'Mire utal az „AAA” minta ?', 'a) Három lépésre osztott tesztmegközelítésre.', 'b) A tesztkörnyezet inicializálásának, futtatásának és lezárásának mintájára.', 'c) A kiemelkedően magas megbízhatóságú tesztelésre .', 'd) A játékfejlesztésben használt módszertanokra.', '', '', 'A', '', 1, 4, 2),
(118, 'Mikor hasznos az @Before  vagy [SetUp]  annotációk használata egy tesztesetek et \nmegelőző metódusnál ?', 'a) Minden tesztesetnek azonos kiindulási állapotra van szüksége.', 'b) Minden tesztesetnek egyetlen közös en használat állapotra van szüksége.', 'c) Amikor a  tesztkörnyezet egyedi konfiguráció t igényel .', 'd) Amikor a  tesztesetek  egyedi  paraméterezésé t igényelnek .', '', '', 'A', '', 1, 4, 2),
(119, 'Mit jelent a TDD (Test -Driven Development)  megközelítés?', 'a) Szervezési irányelv. A csapat struktúrában a  tesztelő kap kiemelt hangsúlyt .', 'b) Fejlesztési módszertan. E lőbb írjuk meg a teszte ket, csak utána a kódot .', 'c) Tesztelési stratégia . Kizárólag automatikus teszteket használunk.', 'd) Fejlesztési filozófia. A kódot a tesztek működéséhez igazítjuk.', '', '', 'B', '', 1, 4, 2),
(120, 'Melyik helyzetben hasznos a  valós objektumokat helyettesítő  „Mock ”, „Fake”  vagy \n„Stub”  technik ák alkalm azása?', 'a) Egy API válasz  idejét teszteljük, a valódi szolgáltatás elérése nélkül.', 'b) Az adatbázis skálázhatóságát teszteljük valós környezetben.', 'c) Egy rendszer teljesítményét teszteljük szimulált forgalommal .', 'd) Egy külső erőforrást nem kívánunk a tesztelés során elérni.', '', '', 'D', '', 1, 4, 2),
(121, 'A nagyfelbontású monitor azt jelenti, hogy…', 'a monitor sok színt tud kezelni.', 'a monitor képfrissítése: 120 Hz, vagy több.', 'a monitor képpontjainak száma vertikálisan és horizontálisan is nagy.', 'a monitor képátlója 22”, vagy anná l nagyobb.', '', '', 'C', '', 3, 0, 2),
(122, 'Melyik állítás igaz?', 'A programok szerzői jogát a törvény nem, csak a BSA védi.', 'A megvásárolt program egy adásvétel keretében eladható.', 'A szoftverhez mellékelt dokumentáció nem tartozik a szerzői jog védelme alá.', 'A freeware és s hareware ugyanazt jelenti.', '', '', 'B', '', 3, 0, 2),
(123, 'Melyik állítás igaz az M2M technológiára?', 'Az M2M technológi a az emberek közötti biztonságos és titkosított kommunikációt valósítja meg.', 'Az M2M technológia olyan adatáramlást jelent, mely emberi közreműködés nélkül, gépek között zajlik.', 'Az M2M technológia a csoportmunka legújabb, egyben legfontosabb kommunikációs eszköze.', 'Az M2M technológia minimum 20Gbit/s -os vonalon valósítható csak meg.', '', '', 'B', '', 3, 0, 2),
(124, 'Ohm törvényének felhasználásával válassza ki, hogy mennyi lesz az U értéke, ha az R=76Ω és az I=1,2A?', '100V', '91,2V', '63,3V', '15,7V', '', '', 'B,D', '', 3, 0, 2),
(125, 'Melyik pixelgrafikus fájlformátum az alábbiak közül?', 'PDF', 'CDR', 'BMP', 'SWF', '', '', 'C', '', 3, 0, 2),
(126, 'A felsorolt eszközök közül melyik nem periféria?', 'Mikrofon', 'CPU (Central Processing Unit)', 'Játékvezérlő', 'Hangkártya', '', '', 'B', '', 3, 0, 2),
(127, 'Mit jelent az EULA?', 'elolvasása után lesz jogunk használni egy programot', 'végfelhasználói licencszerződés', 'szabad szoftverek használatát szabályozó szerződés', 'csak az EULA jogköre alá tartozó szoftverek létezhetnek', '', '', 'B', '', 3, 0, 2),
(128, 'Mekkora a Class 1 Bluetooth maximális hatótávolsága?', '20 m', '50 m', '10 m', '100 m', '', '', 'D', '', 3, 0, 2),
(129, 'Az alábbi állítások közül melyik igaz a vírusokra?', 'Ha a rendszerbe vírus került, semmiképp sem irthat ó le a merevlemezen lévő vírusirtóval. Ki kell venni a rendszerlemezt és másik gépbe helyezni a sikeres írtáshoz .', 'Megfertőzheti a merevlemez boot szektorát, végső soron akár a teljes merevlemez tartalma elveszhet.', 'A vírusok egy speciális fajtája az elektro nikus sugárzáson keresztül is terjed, így egy kis irodában lévő minden számítógép gyorsan megfertőződhet.', 'A számítógépes vírusok egymásnak is ártanak, ezért egy gépen egyszerre csak egy vírus lehet jelen.', '', '', 'A,B,D', '', 3, 0, 2),
(130, 'Melyik parancs segítségével törölhe tő Linuxos ren dszeren egy könyvtárból az összes , csak „archiv ” karakterekkel kezdődő állomány ?', 'rm a*', 'del archiv*', 'rm archiv', 'rm archiv*', '', '', 'D', '', 3, 0, 2),
(131, 'Melyik a processzor órajel lehetséges értéke napjainkban asztali számítógépek esetén?', '2,2 kHz', '3,2 MHz', '4,2 GHz', '5,2 THz', '', '', 'C', '', 3, 0, 2),
(132, 'Melyik állítás helyes?', 'A RAM tartalma szabadon módosítható, nem úgy, mint a merevlemezé.', 'A HDD egy memóriatípust jelent, és a High Density Data storage rövidítése.', 'Mentéskor az adat háttértárolóra kerül.', 'Egy BR-ROM meghajtó általában gyorsabb eszköz, mint a merevlemez.', '', '', 'C', '', 3, 0, 2),
(133, 'Mely adathordozó nem formázható?', 'Merevlemez', 'USB pen drive', 'SD kártya', 'DVD -ROM', '', '', 'D', '', 3, 0, 2),
(134, 'Melyik állítás helyes?', 'Az operációs rendszer egy interfész, ami a hardver és a felhasználó közötti kapcsolatot biztosítja.', 'Az operációs rendszer a gép bekapcsolásakor automatikusan a ROM -ba töltődik.', 'Egy operációs rendszernek nincs hardverigénye, bármilyen konfiguráción működnie kell.', 'Az operációs rendszer verziója, fajtája nem befol yásolja a már megvásárolt programjaink futtathatóságát. (Minden operációs rendszeren minden legális program fut)', '', '', 'A,D', '', 3, 0, 2),
(135, 'Jelölje az igaz állítást!', 'A biztonsági másolatot csak a rendszergazda készíthet a gépünk állományairól .', 'Az operációs rendszerek általában támogatják a biztonsági másolatok készítését.', 'Hardverhiba nem okozhat adatvesztést, így a biztonsági másolatok elsősorban a véletlen törlések és a vírusok ellen védenek.', 'Biztonsági másolat csak cserélhető adathordozóra készít hető.', '', '', 'B', '', 3, 0, 2),
(136, 'Az alábbi eszközök közül melyikről nem lehet betölteni egy P C operációs rendszerét?', 'floppy lemez', 'CD-ROM', 'streamer kazetta', 'pendrive', '', '', 'C', '', 3, 0, 2),
(137, 'Egy CAD/CAM munkaállomás kia lakításánál mely hardvereszköz kiemelt szerepű az alábbiak közül?', 'nagy teljesítményű videókártya', 'csúcsminőségű hangkártya', 'DisplayPort', 'fejlett hűtéstechnika', 'HDMI/DVI kimenet', '', 'A', '', 3, 0, 2),
(138, 'Milyen színrendszert használnak a monitorok?', 'HSV', 'RGB', 'CMYK', 'CRY', '', '', 'B', '', 3, 0, 2),
(139, 'Mi a funkciója az eseménynaplónak?', 'A felhasználok neveit és jelszavait tárolja.', 'A felhasználók kedvenc weboldalait tárolja.', 'A vírusdefiníciós adatbázist tárolja.', 'A gép hardveres és szoftveres változásainak nyomon követését segíti elő.', '', '', 'D', '', 3, 0, 2),
(140, 'Melyik a Windows 10 alapértelmezett fájlrendszere?', 'exFAT', 'NTFS', 'FAT32', 'EXT4', '', '', 'B', '', 3, 0, 2),
(141, 'Videokártyacsere esetén mely szempont a legfo ntosabb ?', 'a gépbe szerelt RAM mérete', 'a gép CPU típusa', 'a beépített HDD mérete', 'az alaplapi bővítőhely típusa', '', '', 'D', '', 3, 0, 2),
(142, 'Melyik állítás igaz a RAM -ra?', 'Írható -olvasható.', 'Csak olvasható.', 'Soros elérésű.', 'Olyan memória, amely kikapcsolás után is megőrzi tartalmát.', '', '', 'A', '', 3, 0, 2),
(143, 'Az alábbi eszközök közül melyiken szabad töredezettség mentesítést végezni?', 'HDD', 'Blu-Ray lemez', 'SD kártya', 'SSD meghajtó', '', '', 'A', '', 3, 0, 2),
(144, 'Melyik rövidítés port az alábbiak közül?', 'SCSI', 'RFI', 'UTP', 'UPS', '', '', 'A', '', 3, 0, 2),
(145, 'Egy videokártyán 600x400 képpont felbontásban 2 szín használható (fekete és fehér). Mekkora memóriára van szük ség ennek megjelenítéséhez?', '240 000 Bájt', '30 000 Bájt', '0,24 Mbájt', '0,3 MBájt', '', '', 'B,D', '', 3, 0, 2),
(146, 'Mi a CACHE funkciója?', 'Lehetővé teszi a számítógép számára a hálózathoz való csatlakozást.', 'A játékok és grafikus alkalmazások számára illesztő felületet biztosít.', 'A számítógép bekapcsolásakor e llenőrzi az összes belső összetevőt.', 'Ideiglenes adattárolást biztosít a CPU számára.', '', '', 'D', '', 3, 0, 2),
(147, 'Egy hálózati kártya MAC címe hexadecimálisan: 01 -40-F4-43-04-F3. Melyik a bináris megfelelője? ... pont / 2 po nt a) 0100000011110100010000110000010011110011 b) 000000010100000011110100010000110000010011110011 c) 00100000011110100010000110000010011110011 d) 000100000011110100001000000010100000010011110011 28. Mi okozhatta azt, hogy a lézer nyomtató „csíkosan” nyomtatott a papírra?', 'A nyomtatószoftver gazdaságos üzemmódra van állítva.', 'A nyomtató szalagja elkopott.', 'A toner ben kevés a festék .', 'A nyomtatót fotópapír helyett más típusú papírral töltötték fel.', '', '', 'B', '', 3, 0, 2),
(242, 'Milyen előnye van az e -ink használatának???', 'az e-ink technológia közel 16.7 millió szín megjelenítését teszi lehetővé.', 'az e-ink kijelzőknek nagyon magas a képfrissítési frekvenciája ez ért nem fárasztja a szemet hosszabb használat esetén sem.', 'az e-ink kijelző csak akkor fogyaszt áramot, amikor változik a kép, ezért sokáig nem kell újratölteni.', 'az e-ink kijelző nem vibrál , ezért sokkal kevésbé fárasztja a szemet használat közben, mint a tft monitorok.', '', '', 'C,D', '', 2, 1, 4),
(243, 'Melyik állítás igaz?', 'A programok szerzői jogát a törvény nem, csak a BSA védi.', 'A megvásárolt program egy adásvétel keretében eladható.', 'A szoftverhez mellékelt dokumentáció nem tartozik a szerzői jog védelme alá.', 'A freeware és shareware ugyanazt jelenti.', '', '', 'B', '', 2, 1, 2),
(244, 'Melyik állítás igaz az M2M technológiára?', 'Az M2M technológia az emberek közötti biztonságos és titkosított kommunikációt valósítja meg.', 'Az M2M technológia olyan adatáramlást jelent, mely emberi közreműködés nélkül, gépek között zajlik.', 'Az M2M technológia a csoportmunka legújabb, egyben legfontosabb kommunikációs eszköze.', 'Az M2M technológia minimum 20Gbit/s-os vonalon valósítható csak meg.', '', '', 'B', '', 2, 1, 2),
(245, 'Ohm törvényének felhasználásával válassza ki, hogy mennyi lesz az U értéke, ha az R=76Ω és az I=1,2A?', '100V', '91,2V', '63,3V', '15,7V', '', '', 'B', '', 2, 1, 2),
(246, 'Melyik pixelgrafikus fájlformátum az alábbiak közül?', 'PDF', 'CDR', 'BMP', 'SWF', '', '', 'C', '', 2, 1, 2),
(247, 'A felsorolt eszközök közül melyik nem periféria?', 'Mikrofon', 'RAM', 'Játékvezérlő', 'Hangkártya', '', '', 'B', '', 2, 1, 2),
(248, 'Mit jelent az EULA?', 'elolvasása után lesz jogunk használni egy programot', 'végfelhasználói licencszerződés', 'szabad szoftverek használatát szabályozó szerződés', 'csak az EULA jogköre alá tartozó szoftverek létezhetnek', '', '', 'B', '', 2, 1, 2),
(249, 'Mekkora a Class  1 Bluetooth maximális hatótávolsága?', '20 m', '50 m', '10 m', '100 m', '', '', 'D', '', 2, 1, 2),
(250, 'Az alábbi állítások közül melyik igaz a vírusokra?', 'Ha a rendszerbe vírus került, semmiképp sem irtható le a merevlemezen lévő vírusirtóval. Ki kell venni a rendszerlemezt és másik gépbe helyezni a sikeres írtáshoz', 'Megfertőzheti a merevlemez boot szektorát, végső soron akár a teljes merevlemez tartalma elveszhet.', 'A vírusok egy speciális fajtája az elektronikus sugárzáson keresztül is terjed, így egy kis irodában lévő minden számítógép gyorsan megfertőződhet.', 'A számítógépes vírusok egymásnak is ártanak, ezért egy gépen egyszerre csak egy vírus lehet jelen.', '', '', 'B', '', 2, 1, 2),
(251, 'Melyik parancs segítségével törölhe tő Linuxos rendszeren  egy könyvtárból az összes, csak „archiv” karakterekkel kezdődő állomány? ', 'rm a*', 'del archiv*', 'rm archiv', 'rm archiv*', '', '', 'D', '', 2, 1, 2),
(252, 'Melyik a processzor órajel lehetséges értéke napjainkban asztali számítógépek esetén? ', '2,2 kHz', '3,2 MHz', '4,2 GHz', '5,2 THz', '', '', 'C', '', 2, 1, 2),
(253, 'Melyik állítás helyes?', 'A RAM tartalma szabadon módosítható, nem úgy mint a merevlemezé.', 'A HDD egy memóriatípust jelent, és a High Density Data storage rövidítése.', 'Mentéskor az adat háttértárolóra kerül.', 'Egy BR-ROM meghajtó általában gyorsabb eszköz, mint a merevlemez.', '', '', 'C', '', 2, 1, 2),
(254, 'Mely adathordozó nem formázható?', 'Merevlemez', 'USB pen drive', 'SD kártya', 'DVD-ROM', '', '', 'D', '', 2, 1, 2),
(255, 'Hány elsődleges partíció lehet egy háttértáron ?', '4', '2', '6', 'bármennyi', '', '', 'A', '', 2, 1, 2),
(256, 'Hol tárolódik a BIOS-ban beállított adat?', 'Az operatív tárban.', 'A BIOS és a CMOS tárolja', 'Háttértárolón', 'Az operációs rendszer gondoskodik a backupról.', '', '', 'B', '', 2, 1, 2),
(257, 'Az alábbi eszközök közül melyikről nem lehet betölteni egy Pc operációs rendszerét?', 'floppy lemez', 'CD-ROM', 'streamer kazetta', 'pendrive', '', '', 'C', '', 2, 1, 2),
(258, 'Egy CAD/CAM munkaállomás kialakításánál mely hardvereszköz kiemelt szerepű az alábbiak közül?', 'nagy teljesítményű videókártya', 'csúcsminőségű hangkártya', 'DisplayPort', 'fejlett hűtéstechnika', 'HDMI/DVI kimenet', '', 'A', '', 2, 1, 2),
(259, 'Milyen színrendszert használnak a monitorok?', 'HSV', 'RGB', 'CMYK', 'CRY', '', '', 'B', '', 2, 1, 2),
(260, 'Hány lemez szükséges minimum a RAID 5 megvalósításához?', '2', '3', '4', '5', '', '', 'B', '', 2, 1, 2),
(261, 'Melyik a Windows 10 alapértelmezett fájlrendszere?', 'exFAT', 'NTFS', 'FAT32', 'EXT4', '', '', 'B', '', 2, 1, 2),
(262, 'Videokártyacsere esetén mely szempont  a legfontosabb?', 'a gépbe szerelt RAM  mérete', 'a gép CPU típusa', 'a beépített HDD mérete', 'az alaplapi bővítőhely típusa', '', '', 'D', '', 2, 1, 2),
(263, 'Melyik állítás igaz a RAM-ra?', 'Írható-olvasható.', 'Csak olvasható.', 'Soros elérésű.', 'Olyan memória, amely kikapcsolás után is megőrzi tartalmát.', '', '', 'A', '', 2, 1, 2),
(264, 'Az alábbi eszközök közül melyiken szabad töredezettség mentesítést végezni?', 'HDD', 'Blu-Ray lemez', 'SD kártya', 'SSD meghajtó', '', '', 'A', '', 2, 1, 2),
(265, 'Melyik rövidítés port az alábbiak közül?', 'SCSI', 'RFI', 'UTP', 'UPS', '', '', 'A', '', 2, 1, 2),
(266, 'Mi a CACHE funkciója?', 'Lehetővé teszi a számítógép számára a hálózathoz való csatlakozást.', 'A játékok és grafikus alkalmazások számára illesztő felületet biztosít.', 'A számítógép bekapcsolásakor ellenőrzi az összes belső összetevőt.', 'Ideiglenes adattárolást biztosít a CPU számára.', '', '', 'D', '', 2, 1, 2),
(267, 'Egy hálózati kártya MAC címe hexadecimálisan: 01-40-F4-43-04-F3. Melyik a bináris megfelelője?', '0100000011110100010000110000010011110011', '000000010100000011110100010000110000010011110011', '00100000011110100010000110000010011110011', '000100000011110100001000000010100000010011110011', '', '', 'B', '', 2, 1, 2),
(268, 'Mi okozhatta azt, hogy a lézer nyomtató „csíkosan” nyomtatott a papírra?', 'A nyomtatószoftver gazdaságos üzemmódra van állítva.', 'A nyomtató szalagja elkopott.', 'A tonerben kevés a festék.', 'A nyomtatót fotópapír helyett más típusú papírral töltötték fel.', '', '', 'C', '', 2, 1, 2),
(269, 'Milyen színrendszert használnak a nyomtatók?', 'HSV', 'RGB', 'CMYK', 'CRY', '', '', 'C', '', 2, 1, 2),
(270, 'Melyik állítás igaz a ROM-ra?', 'Tartalmát a gép kikapcsolásakor is megtartja', 'Bármelyik része közvetlenül megcímezhető, írható, olvasható', 'Működése mágneses technikán alapul', 'Mérete nagyban befolyásolja a gép sebességét', '', '', 'A', '', 2, 1, 2),
(271, 'Az alábbiak közül melyek az alkalmazási réteg protokolljai?', 'POP3', 'ICMP', 'CSMA/CD', 'SMTP', 'TCP', '', 'D', '', 2, 2, 4),
(272, 'Az alábbiak közül melyik irányító protokoll?', 'OSF', 'PIR', 'EIGRP', 'SNMP', '', '', 'C', '', 2, 2, 2),
(273, 'Mit jelent a CSMA/CD csatornahozzáférési mód esetén a CD kifejezés?', 'vivőjel érzékelés', 'ütközés figyelés', 'ütközés elkerülés', 'ütközés megelőzés', '', '', 'B', '', 2, 2, 2),
(274, 'Melyik TCP/IP modell réteg felel meg az OSI első két rétegének?', 'Alkalmazási', 'Hálózatelérési', 'Szállítási', 'Internet', '', '', 'B', '', 2, 2, 2),
(275, 'Mi történik, ha nem, vagy hibásan adjuk meg az alapértelmezett átjáró címét egy\r\nhálózatra kötött gép konfigurálásakor?', 'A gép a belső hálózat gépeit el fogja érni.', 'A gép a belső és külső hálózat gépeit is eléri.', 'A gép csak a külső hálózat gépeit fogja elérni.', 'A gép semmilyen más géppel nem fog tudni kommunikálni.', '', '', 'A', '', 2, 2, 2),
(276, 'Mi a hiba a következő IPv6-címmel: 2001:DB6:85a3::1319:8a2e::7348?', 'Nem FE80-al kezdődik.', 'DB6 helyett 0DB6-ot kell írni, így nem érvényes a cím.', 'Két helyen van benne dupla kettőspont.', 'Mindenhol dupla kettőspontnak kellene szerepelnie.', '', '', 'C', '', 2, 2, 2),
(277, 'Mi a neve annak az eljárásnak, amikor belső IP címeket fordítunk át egy külső IP\r\ncímre, és azzal érik el a belső hálózat gépei a távoli kiszolgálókat?', 'NAI', 'PAI', 'NAT', 'ATP', '', '', 'C', '', 2, 2, 2),
(278, 'Mi a MAC-cím utolsó 24 bitjének rövidített neve?', 'OUI', 'LLC', 'NIC', 'MAC', '', '', 'C', '', 2, 2, 2),
(279, 'Mi a szórási címe a 180.168.120.100 állomás alhálózatának, ha /25-ös az alhálózati\r\nmaszkja?', '180.168.120.64', '180.168.120.95', '180.168.120.127', '180.168.120.255', '', '', 'C', '', 2, 2, 2),
(280, 'Milyen IPv6-cím a 2001:db8:a0b:12f0::1?', 'Csoportcím', 'Egyedi cím', 'Szórásos cím', 'Érvénytelen cím', '', '', 'B', '', 2, 2, 2),
(281, 'Melyik fogalom kapcsolódik WLAN-ok biztonságához?', 'WAP', 'VLAN', 'WPA2', 'VTP', '', '', 'C', '', 2, 2, 2),
(282, 'A forgalomirányító melyik memóriájában található az indító konfiguráció?', 'ROM', 'FLASH', 'NVRAM', 'RAM', '', '', 'C', '', 2, 2, 2),
(283, 'Mely alkalmazás - port páros helyes?', 'ssh – 23', 'ftp – 21', 'smtp – 69', 'https - 433', '', '', 'B', '', 2, 2, 2);
INSERT INTO `feladat` (`feladat_id`, `feladat_kerdes`, `feladat_a`, `feladat_b`, `feladat_c`, `feladat_d`, `feladat_e`, `feladat_f`, `feladat_helyes`, `feladat_kep`, `feladat_ev`, `feladat_tema`, `feladat_pont`) VALUES
(284, 'Hogyan vehetjük rá a kapcsolókat, hogy megtanulják a hozzájuk kapcsolt gépek MAC\r\ncímét, és csak a megtanult címet fogadják el a későbbiekben?', 'switchport port-security mac-address sticky', 'switchport port-security mac-address dc-49-a9-3a-6c-73', 'switchport port-security', 'switchport port-secutritiy aging static', '', '', 'A', '', 2, 2, 2),
(285, 'Melyik protokoll segítségével juthatnak IP címhez és hálózati információkhoz a\r\nhálózati eszközök?', 'SNMP', 'IRC', 'DHCP', 'IMAP', '', '', 'C', '', 2, 2, 2),
(286, 'Mi az, ami az UDP protokollból hiányzik, de a TCP protokollban benne van?', 'Hibadetektálás.', 'Adatkommunikáció kiépítésének képessége.', 'IP címek használata.', 'Nyugtázás.', '', '', 'D', '', 2, 2, 2),
(287, 'Az alábbiak közül a 168.100.100.20/27-es című állomás melyiknek nem küld közvetlen\r\nARP kérést, ha kommunikálni szeretne vele? ', '168.100.100.10', '168.100.100.40', '168.100.100.30', '168.100.100.24', '', '', 'B', '', 2, 2, 2),
(288, 'Melyik az az üzenet, amelyet akkor küld egy állomás, ha ismert IP-címhez keres MAC-\r\ncímet?', 'ARP', 'BOOTP', 'DNS', 'RARP', '', '', 'A', '', 2, 2, 2),
(289, 'Milyen átviteli közeg látható az alábbi képen?', 'STP kábel', 'telefon kábel', 'UTP kábel', 'Optikai kábel', '', '', 'B', '2024_19.png', 2, 2, 2),
(290, 'Mi jellemző a kiterjesztett hozzáférési listákra? (2 jó válasz)', 'Csak az irányítandó IP csomagok forráscímét képes ellenőrizni.', 'Forrás, célcím, protokoll és port egyeztetésére egyaránt képesek.', 'Célhoz minél közelebbi router/interfészhez célszerű rendelni.', 'Forráshoz minél közelebbi interfészhez célszerű rendelni.', 'Csak nevesített módon használhatóak.', '', 'B,D', '', 2, 2, 4),
(291, 'Milyen program alkalmas leginkább egy számítógép hálózati adatforgalmának\r\nkontrollálására?', 'Tűzfal', 'Vírusírtó', 'Házirend', 'Reklámblokkoló', '', '', 'A', '', 2, 2, 2),
(292, 'Mi okozhatja az interfész következő állapotát? (2 jó válasz)\r\nSerial0/0/0 is down, line protocol is down (disabled)', 'rossz minőségű kábel', 'lekapcsolt interfész a kapcsolat túloldalán', 'eltérő beágyazási mód a kapcsolat két végén', 'aktív shutdown parancs az interfészen', '', '', 'A,B', '', 2, 2, 2),
(293, 'Mi okozhat egy UTP kábelben elektromágneses interferenciát?', 'Sok UTP kábel egymás mellett elvezetve.', 'Nagyfeszültségű vezetékek az UTP kábel közelében.', 'UTP és STP kábelek egyidejű használata.', 'Rosszul bekötött csatlakozó a kábel végén.', '', '', 'B', '', 2, 2, 2),
(294, 'Melyik fogalomhoz tartozik a következő meghatározás? \r\nA támadások egy speciális fajtája, amikor a támadó nem betörni akar, hanem egy adott\r\nszolgáltatás működését szeretné megbénítani.', 'Denial of Service (DoS)', 'DNS spoofing', 'Address spoofing', 'Portscan', '', '', 'A', '', 2, 2, 2),
(295, 'Melyik állítás igaz a Bluetooth technológiára?', '802.11b szabványt használ.', '2,5 Ghz-es frekvenciasávban működik.', '2,4 Ghz-es frekvenciasávban működik.', 'Csak hang átvitelére használják.', '', '', 'C', '', 2, 2, 2),
(296, 'Milyen alrétegekre lehet osztani az adatkapcsolati réteget? (2 jó válasz)', 'DAT alréteg', 'MAC alréteg', 'LLC alréteg', 'PHZ alréteg', '', '', 'B,C', '', 2, 2, 4),
(297, 'Melyik parancs segítségével hozhat létre egy ’proba’ nevű adatbázist és állíthatja be a karakter kódolást utf8-ra?', 'CREATE DATABASE proba', 'ALTER DATABASE proba CHARACTER SET utf8', 'CREATE DATABASE proba CHARACTER SET utf8', 'DROP DATABASE proba CHARACTER SET utf8', '', '', 'C', '', 2, 3, 2),
(298, 'Melyik parancs segítségével lehet egy adatbázisból névsorban kiíratni a második 10 (11-20) rekord tartalmát?', 'SELECT * FROM adatok ORDER BY nev LIMIT 10, 10', 'SELECT * FROM adatok LIMIT 10 ORDER nev', 'SELECT * FROM adatok ORDER BY nev LIMIT 11, 20', 'SELECT * FROM adatok LIMIT 11, 20 ORDER BY nev', '', '', 'A', '', 2, 3, 2),
(299, 'Melyik parancs segítségével lehet kilistázni „A” és „B” táblából azokat a rekordokat, amik mind a két táblában szerepelnek?', 'SELECT * FROM A INNER JOIN B ON A.kulcs=B.kulcs', 'SELECT * FROM A RIGHT JOIN B ON A.kulcs=B.kulcs WHERE A.kulcs IS NULL', 'SELECT * FROM A FULL OUTER JOIN B ON A.kulcs=B.kulcs WHERE A.kulcs IS NULL OR B.kulcs IS NULL', 'SELECT * FROM A RIGHT JOIN B ON A.kulcs=B.kulcs WHERE B.kulcs IS NUL', '', '', 'A', '', 2, 3, 2),
(300, 'Melyik parancs segítségével lehet kilistázni „A” és „B” táblából azokat a rekordokat, amik csak az A vagy csak a B táblában szerepelnek?', 'SELECT * FROM A INNER JOIN B ON A.kulcs=B.kulcs', 'SELECT * FROM A RIGHT JOIN B ON A.kulcs=B.kulcs WHERE A.kulcs IS NULL', 'SELECT * FROM A FULL OUTER JOIN B ON A.kulcs=B.kulcs WHERE A.kulcs IS NULL OR B.kulcs IS NULL', 'SELECT * FROM A RIGHT JOIN B ON A.kulcs=B.kulcs WHERE B.kulcs IS NULL', '', '', 'C', '', 2, 3, 2),
(301, 'Adott a következő tábla: CAR (rend_sz, marka, tipus, szin, kivitel, evjarat, listaar)\r\nMelyik SQL parancs kérdezi le a 2023 előtti évjáratú autók márkáját és típusát?', 'SELECT marka, tipus WHERE evjarat<2023 FROM car;', 'SELECT * FROM car WHERE evjarat<2023;', 'SELECT marka, tipus FROM car WHERE evjarat<2023;', 'SELECT marka, evjarat FROM car WHERE evjarat>2023;', '', '', 'C', '', 2, 3, 2),
(302, 'A fejlesztői csapat egy közös projekten dolgozik. Az elkészült kód központi repository-ja a https://github.com/user/project címen érhető el. Három branch van, beton, fejleszt és kiadas néven. Jelölje be az alábbiak közül az igaz állításokat! (2 jó válasz)', 'A repository helyi másolatát a git copy https://github.com/user/project paranccsal lehet elkészíteni', 'A kiadas branchre a git checkout kiadas paranccsal lehet átváltani.', 'A git commit paranccsal lehet a helyi változásokat a központi repositoryba feltölteni.', 'A git pull paranccsal lehet a központi repositoryban levő változásokat letölteni.', '', '', 'B,D', '', 2, 3, 4),
(303, 'Adott a következő tábla: CAR  (rend_sz , marka , tipus , szin, kivitel , evjarat , listaar) Mi a hatása a következő SQL utasításnak?\nDELETE FROM car WHERE evjarat BETWEEN 2020 AND 2022;', 'Törli a car tábla összes adatát.', 'Törli az evjarat mezőben lévő azon adatokat, amelyek 2020 és 2022 közé esnek.', 'Törli azon autók összes adatát, amelyeket 2020 és 2022 között gyártottak.', 'Törli azon autók összes adatát, amelyeket 2020-ban vagy 2022-ben gyártottak.', '', '', 'C', '', 2, 3, 2),
(304, 'Adott a következő tábla: CAR (rend_sz, marka, tipus, szin, kivitel, evjarat, listaar)\r\nMelyik SQL parancs ad hozzá egy teljesitmeny nevű mezőt a táblához?', 'ADD TABLE car IN teljesitmeny INT;', 'CREATE TABLE car ADD teljesitmeny INT;', 'ALTER TABLE car ADD teljesitmeny INT;', 'UPDATE TABLE car ADD teljesitmeny INT;', '', '', 'C', '', 2, 3, 2),
(305, 'Adott a következő tábla: CAR (rend_sz, marka, tipus, szin, kivitel, evjarat, listaar)\r\nMelyik SQL parancs segítségével tudja kilistázni azon autók adatait, amik többe\r\nkerülnek, mint a Mazda MX5-ös model?', 'SELECT * FROM car WHERE listaar>Mazda.MX5.listaar;', 'SELECT * FROM car WHERE car.listaar>(SELECT * FROM car WHERE marka=’Mazda’ AND tipus=’MX5’);', 'SELECT * FROM car WHERE car.listaar>(SELECT listaar FROM car WHERE marka=’Mazda’ AND tipus=’MX5’);', 'SELECT * FROM car WHERE listaar>(SELECT marka=’Mazda’ AND tipus=’MX5’);', '', '', 'C', '', 2, 3, 2),
(306, 'Mit eredményez a következő SQL utasítás?\r\nSELECT iskola,Avg(pont) AS [Átlagos pont]\r\nFROM verseny GROUP BY iskola\r\nHAVING (Avg(pont)>80);', 'Megmutatja az iskolák átlagos pontszámait', 'Kikeresi azokat a tanulókat, akiknek a pontja 80 fölött van, és megadja az iskolájukat.', 'Kiírja azon iskolák számát, ahol az átlagos pontszám 80 felett volt.', 'Kikeresi azokat az iskolákat, ahol az átlagos pontszám 80 pont fölött van, és megadja az átlagos pontszámukat.', '', '', 'D', '', 2, 3, 2),
(307, 'Adott a következő tábla: BOOK (konyv_ID, szerzo, cim, kategoria, kiado, kiadev, ar)\r\nMelyik SQL parancs növeli az összes könyv árát 20%-al?', 'UPDATE book SET ar=ar+20;', 'UPDATE book SET ar=ar*1.2;', 'ALTER TABLE book SET ar=ar*1.2', 'UPDATE book SET ar=ar*1.8 WHERE ar<5000;', '', '', 'B', '', 2, 3, 2),
(308, 'Melyik algoritmus-leíró eszköz látható az alábbi ábrán?', 'folyamatábra', 'struktogram', 'Jackson-diagram', 'blokkdiagram', '', '', 'A', '2024_12.png', 2, 3, 2),
(309, 'Melyik vezérlési szerkezet általános alakja a következő? \r\ndo{ciklusmag utasításai;}while (feltétel)', 'kétirányú elágazás', 'növekményes ciklus', 'hátultesztelős ciklus', 'elöltesztelős ciklus', '', '', 'C', '', 2, 3, 2),
(310, 'Mit valósít meg a következő algoritmus?', 'Minimum-kiválasztásos rendezés', 'Közvetlen kiválasztásos rendezés', 'Buborékos rendezés', 'Beillesztéses rendezés', '', '', 'B', '2024_14.png', 2, 3, 4),
(311, 'Melyik kifejezés igaz az alábbiak közül?', '10101101B < 172D', '145D > 90H', '10111111B = BEH', '149D > 10010111B', '', '', 'B', '', 2, 3, 2),
(312, 'Mi lesz a decimális eredmény, ha bitenkénti AND műveletet végzünk 8 biten a\r\nkövetkező két számon?', '28', '30', '31', '60', '', '', 'A', '2024_16.png', 2, 3, 2),
(313, 'Az alábbiak közül mely adattípusok szolgálnak egész számok tárolására? (2 jó válasz) ', 'char', 'short', 'long', 'float', 'double', '', 'B,C', '', 2, 3, 4),
(314, 'Melyik feltételt kell használnunk akkor, ha azt szeretnénk vizsgálni, hogy az adott\r\névszám szökőév-e és egyben századforduló is?', 'evszam % 4 != 0 || evszam % 100 != 0', 'evszam % 4 != 0 && evszam % 100 != 0', 'evszam % 4 == 0 && evszam % 100 == 0', 'evszam % 4 == 0 || evszam % 100 == 0', '', '', 'C', '', 2, 3, 2),
(315, 'Mely kifejezések igazak az alábbiak közül? (2 jó válasz)', '10111001B < 180D', '145D > 8FH', '10111111B = BAH', '150D < 10010111B', '', '', 'B,D', '', 2, 3, 4),
(316, 'Melyik adattípus biztosítja a leggazdaságosabb tárhelyfoglalást, ha egy tornász pontszámait szeretnénk eltárolni (a pontozó bírák által adható maximális pontszám 10, és tizedes értékeket is adhatnak pl.: 8,6)?', 'short', 'float', 'double', 'decimal', '', '', 'B', '', 2, 3, 2),
(317, 'Melyik adatmodell esetén alkalmazható az SQL nyelv?', 'hierarchikus', 'hálós', 'relációs', 'EER', '', '', 'C', '', 2, 3, 2),
(318, 'Melyik fogalomhoz tartozik a következő meghatározás?\r\nOlyan változó, ami egy memóriacímet tartalmaz.', 'Konstruktor', 'Destruktor', 'Metódus', 'Mutató', '', '', 'D', '', 2, 3, 2),
(319, 'OOP (objektumorientált programozás) esetén melyik az a hozzáférési (láthatósági)\r\nszint, amelyben az adott taghoz csak az adott osztály és leszármazottjai férhetnek\r\nhozzá?', 'public', 'protected', 'internal', 'private', '', '', 'B', '', 2, 3, 2),
(320, 'Mi nem igaz az algoritmusra?', 'A feladat megoldásában mind a lépések számának, mind az egyes lépéseknek végesnek kell lennie.', 'Minden lépésnek egyértelműnek kell lennie, hogy ne lehessen félreérteni.', 'Fontos, hogy minden lépés elvégezhető legyen.', 'Csak valamilyen algoritmus leíró nyelven készülhet.', '', '', 'D', '', 2, 3, 2),
(321, 'Melyik nem része egy algoritmusnak?', 'Szekvencia', 'Specifikáció', 'Szelekció', 'Iteráció', '', '', 'B', '', 2, 3, 2),
(322, 'Melyik kifejezés hiányzik a mondatból?Objektumorientált programozás esetén a ______________ felelős az objektum által\r\nhasznált erőforrások felszabadításáért.', 'konstruktor', 'destruktor', 'metódus', 'virtuális metódus', '', '', 'B', '', 2, 3, 2),
(323, 'Mit csinál az alábbi programkód?', 'Kiírja 12 osztóit a képernyőre, kivéve a 12-öt, vesszővel elválasztva.', 'Kiírja a 12 osztóit a képernyőre vesszővel elválasztva.', 'Kiírja a 12 prímosztóit a képernyőre vesszővel elválasztva.', 'Kiírja a számokat 1-től 12-ig a képernyőre vesszővel elválasztva.', '', '', 'B', '2024_1.png', 2, 4, 2),
(324, 'Mi kerül a képernyőre az alábbi program futásának eredményeként?', '4', '16', '24', '32', '', '', 'C', '2024_2.png', 2, 4, 4),
(325, 'Melyik HTML utasítással jelezhetjük egy felsorolás elemeit?', '<dl>', '<li>', '<il>', '<list>', '', '', 'B', '', 2, 4, 2),
(326, 'Melyik HTML utasítás eredményez működő hiperhivatkozást?', '<a href=\"http://www.parlament.hu\">Országgyűlés</a>', '<a name=\"http://www.parlament.hu\">Országgyűlés</a>', '<a>http://www.parlament.hu</a>', '<a url=\"http://www.parlament.hu\">Országgyűlés</a>', '', '', 'A', '', 2, 4, 2),
(327, 'Az alábbiak közül melyik határoz meg jelölőnégyzet típusú űrlap mezőt?', '<input type=\"check\" name=\"auto\" value=\"1\">', '<form type=\"checkbox\" name=\"auto\" value=\"1\">', '<input type=\"checkbox\" name=\"auto\" value=\"1\">', '<input type=\"checkname=\"auto\" value=\"1\">', '', '', 'C', '', 2, 4, 2),
(328, 'Milyen tag-et kell használni a weboldalak táblázataiban a táblázat egy-egy cellájának\r\nmeghatározására?', '<cell>', '<td>', '<tr>', '<table>', '', '', 'B', '', 2, 4, 2),
(329, 'Melyik megoldással léphetünk vissza az előző oldalra egy weblapon?', '<a href=”history.back()”>Vissza</a>', '<a href=”history.go(-1)”>Vissza</a>', '<a href=”javascript:history.back()”>Vissza</a>', '<a href=”javascript.history.go(-1)”>Vissza</a>', '', '', 'C', '', 2, 4, 2),
(330, 'Hogyan hozható létre egy weboldalon belül a „fejezet1” nevű könyvjelzőre mutató\r\nhivatkozás?', '<a name=\"#fejezet1\">Első fejezet</a>', '<a id=\"fejezet1\">Első fejezet</a>', '<a href=\"#fejezet1\">Első fejezet</a>', '<a href=\"fejezet1.html\">Első fejezet</a>', '', '', 'C', '', 2, 4, 2),
(331, 'HTML-ben melyik határoz meg egyszerű (egysoros) szöveges beviteli mezőt?', '<text name=\"cím\" value=\"\">', '<select type=\"text\" name=\"cím\" value=\"\">', '<option type=\"text\" name=\"cím\" value=\"\">', '<input type=\"text\" name=\"cím\" value=\"\">', '', '', 'D', '', 2, 4, 2),
(332, 'Hogyan adható meg a HTML táblázatokban a keret vastagsága?', 'a <table> \"line\" jellemzőjével', 'a <table> \"border\" jellemzőjével', 'a <table> \"margin\" jellemzőjével', 'a <table> \"width\" jellemzőjével', '', '', 'B', '', 2, 4, 2),
(333, 'Mire szolgál a HTML űrlapoknál az <input type=\"button\"> tag?', 'Szöveges beviteli mező elhelyezésére.', '\"Űrlap elküldése\" gomb elhelyezésére.', 'Nyomógomb elhelyezésére.', 'Az űrlap aláírására.', '', '', 'C', '', 2, 4, 2),
(334, 'Melyik HTML utasítással csatolhatjuk a külső CSS fájlt a weblaphoz?', '<stylesheet> rel=\"stylesheet\" mystyle.css type=\"text/css\"</stylesheet>', '<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyle.css\">', '<style src=\"mystyle.css\" rel=\"stylesheet\" type=\"text/css\">', '<a href=\"mystyle.css\" rel=\"stylesheet\" type=\"text/css\"></a>', '', '', 'B', '', 2, 4, 2),
(335, 'Hogyan épül fel általánosan egy CSS utasítás?', 'kijelölö{tulajdonság1:ertek1;tulajdonsag2:ertek2;}', 'kijelölö{tulajdonság1,tulajdonsag2:ertek1,ertek2;}', '#tulajdonság{kijelölö: ertek1:ertek2;}', '.tulajdonság{kijelölö: ertek1:ertek2;}', '', '', 'A', '', 2, 4, 2),
(336, 'Melyik CSS utasítás igazítja balra a picture azonosítójú képet?', '.picture{text-align:left}', '#picture{float:left}', '#picture{text-align:left}', '.picture{float:left}', '', '', 'B', '', 2, 4, 2),
(337, 'Melyik CSS utasítással készíthetünk egy olyan „side” azonosítójú szelektort, amely a magasságot 500, a szélességet 80 képpontosra állítja?', '#side{height:80px;width:500px}', '.side{height:500px;width:80px}', '#side{height:500px;width:80px}', '.side{height:80px;width:500px}', '', '', 'C', '', 2, 4, 2),
(338, 'Mit eredményez a következő CSS utasítás: h2 {text-decoration:underline;}', 'A címsort h2-re állítja.', 'Hibás utasítás.', 'A h2 címsort színesre állítja.', 'A h2 címsort aláhúzottra állítja.', '', '', 'D', '', 2, 4, 2),
(339, 'Melyik CSS utasítással állíthatjuk a weboldal „menü” elemének betűtípusát Arialra?', 'body {text-style:Arial;}', 'text {font-family:Arial;}', 'menu {font-family:Arial;}', 'body {text-family:Arial;}', '', '', 'C', '', 2, 4, 2),
(340, 'Mit végez el a következő CSS utasítás? #kép {width:200px;}', 'Az összes kép szélességét 200 pontosra állítja.', 'A kép osztályú elem szélességét 200 pontosra állítja.', 'A kép azonosítójú elem szélességét 200 pontosra állítja.', 'Ez egy hibás utasítás.', '', '', 'C', '', 2, 4, 2),
(341, 'CSS-ben keretet szeretne készíteni a következő keretvastagságokkal:\r\nFelső keret = 10 képpont, alsó keret = 5 képpont, bal oldali keret = 20 képpont, jobb oldali keret = 1 képpont.\r\nMelyik a helyes parancs erre a célra?', 'border-width:10px 20px 5px 1px;', 'border-width:10px 1px 5px 20px;', 'border-width:10px 5px 20px 1px;', 'd border-width:5px 20px 10px 1px;', '', '', 'B', '', 2, 4, 2),
(342, 'Melyik CSS utasítás szünteti meg a hiperhivatkozások aláhúzását?', 'a {text-decoration:none;}', 'a {underline:none;}', 'a {text-decoration:no-underline;}', '{decoration:no-underline;}', '', '', 'A', '', 2, 4, 2),
(343, 'Melyik JavaScript kód változtatja meg az alábbi „proba” azonosítójú bekezdésben\r\nmegjelenő szöveget?\r\n<p id=\"proba\">Jó reggelt!</p>', 'document.getElement(\"p\").innerHTML = \"Jó napot!\";', '#proba.innerHTML = \"Jó napot!\";', 'document.getElementByName(\"p\").innerHTML = \"Jó napot!\";', 'document.getElementById(\"proba\").innerHTML = \"Jó napot!\";', '', '', 'D', '', 2, 4, 2),
(344, 'Hogyan épül fel a számlálós ciklus ciklusfeje JavaScriptben?', 'for i in range(1,5)', 'for i range(0;5)', 'for (i = 0; i <= 5; i++)', 'for (i <= 5; i++)', '', '', 'C', '', 2, 4, 2),
(345, 'Hogyan helyezhető el többsoros megjegyzés python kódban?', '//Ez egy\r\ntöbbsoros megjegyzés//', '/*Ez egy\r\ntöbbsoros megjegyzés*/', '<!--Ez egy\r\ntöbbsoros megjegyzés-->', '”””\r\nEz egy\r\ntöbbsoros megjegyzés\r\n”””', '', '', 'D', '', 2, 4, 2),
(346, 'Az alábbiak közül melyik hoz létre 3 elemű tömböt JavaScriptben?', 'var colors = 1 = (\"red\"), 2 = (\"green\"), 3 = (\"blue\")', 'var colors = (1:\"red\", 2:\"green\", 3:\"blue\")', 'var colors = {\"red\", \"green\", \"blue\"}', 'var colors = [\"red\", \"green\", \"blue\"]', '', '', 'D', '', 2, 4, 2),
(347, 'Hogyan írhatjuk egy figyelmeztető ablakba a \"Hello\" szöveget JavaScriptben?', 'msg(\"Hello\");', 'alertBox(\"Hello\");', 'alert(\"Hello\");', 'msgBox(\"Hello\");', '', '', 'C', '', 2, 4, 2),
(348, 'Melyik HTML elembe kell elhelyezni a JavaScript kódot?', '<javascript>', '<script>', '<scripting>', '<js>', '', '', 'B', '', 2, 4, 2),
(349, 'JavaSriptben melyik metódussal csonkolható egy tört szám egészre?', 'Math.pow()', 'round()', 'Math.floor()', 'Math.round()', '', '', 'C', '', 2, 4, 2),
(350, 'Mi lesz az x változó értéke a következő PHP kód lefutása után?', '1', '5', '10', '15', '', '', 'A', '2024_28.png', 2, 4, 2),
(351, 'Mi lesz az x változó értéke a következő PHP kód lefutása után?', '2', '4', '8', '16', '', '', 'B', '2024_29.png', 2, 4, 2),
(352, 'PHP programnyelvben melyik utasítással nyitható meg a jelszo.txt fájl olvasásra és\r\nírásra?', 'open(\"jelszo.txt\");', 'fopen(\"jelszo.txt\",\"r\");', 'fopen(\"jelszo.txt\",\"r+\");', 'open(\"jelszo.txt\",\"rw\");', '', '', 'C', '', 2, 4, 2),
(353, 'Mely állítások igazak az objektumorientált programozással (OOP) kapcsolatban?', 'A természetes gondolkodást, cselekvést közelítő programozási mód.', 'Csak vizuális programozási nyelven készíthetünk OOP programot.', 'A vizuális programozási nyelvben készített programok mindig objektumorientáltak.', 'A mezők az adott osztály alapján létrehozott objektumpéldányok között nem\r\nkerülnek megosztásra, hanem minden példány külön-külön mezőkészlettel\r\nrendelkezik.', 'Az absztrakt osztályok a legtöbb nyelvben nem példányosíthatók.', 'Fontos jellemzőjük az öröklés, amely azt jelenti, hogy egy adott tevékenység (metódus)\r\nazonosítója közös lehet egy adott objektum hierarchián belül, ugyanakkor a hierarchia\r\nminden egyes objektumában a tevékenységeket végrehajtó metódus implementációja a', 'A,D,E', '', 2, 4, 6),
(354, 'Mekorra lesz az x változó értéke a következő Java kód lefutása után?', '1', '4', '8', '24', '', '', 'C', '2024_32.png', 2, 4, 2),
(355, 'Melyik rendezési algoritmust valósítja meg a következő Java kód?', 'Minimum-kiválasztásos rendezés', 'Közvetlen kiválasztásos rendezés', 'Buborékos rendezés', 'Beillesztéses rendezés', '', '', 'A', '2024_33.png', 2, 4, 4),
(356, 'A szoftverfejlesztés melyik szakaszában definiálják a szoftver funkcióit, illetve annak megszorításait?', 'Szoftverspecifikáció', 'Szoftvertervezés és implementáció', 'Szoftvervalidáció', 'Szoftverevolúció', '', '', 'A', '', 2, 4, 2),
(357, 'Mely állítások igazak a szoftverfejlesztés során alkalmazott vízesésmodellre?\r\n(2 jó válasz)', 'Alapja az iteráció, melynek segítségével eltérő szakaszokban ugyanazon fejlesztési\r\nterület kidolgozását teszi lehetővé a precízebb végeredmény érdekében.', 'Alapvető elgondolása, hogy az ügyfél által a tervezési fázisban felállított\r\nkövetelmények a fejlesztés során megváltozhatnak.', 'Egyszerű és könnyen menedzselhető felépítése miatt a kisebb és jól definiált\r\nprojektekhez gyakran használják.', 'A fejlesztést több részfolyamatra bontják és minden fázist az előző jóváhagyása és\r\nbefejezése után indítanak el.', 'Az általános fejlesztési eljárás helyett egy projektre szabható, igények szerint\r\nváltoztatható keretet nyújt.', '', 'C,D', '', 2, 4, 4),
(358, 'Határozza meg az alábbi algoritmus eredményét!', 'N=2 X=9 K=4', 'N=4 X=10 K=3', 'N=6 X=5 K=1', 'N=7 X=10 K=3', '', '', 'B', '2024_36.png', 2, 4, 4),
(359, 'Mennyi lesz x és y értéke az alábbi programrészlet lefutásakor?', 'x=0 és y=3', 'x=3 és y=3', 'x=2 és y=3', 'x=3 és y=1', '', '', 'C', '2024_37.png', 2, 4, 4),
(360, 'Mi kerül a képernyőre az alábbi program futásának eredményeként?', '3', '7', '5', '8', '', '', 'D', '2024_38.png', 2, 4, 4),
(361, 'Milyen értéket ad vissza az alábbi függvény X = 2023 esetén?', '1', '3', '20', '202', '', '', 'B', '2024_39.png', 2, 4, 4),
(362, 'Milyen értéket ad vissza az alábbi függvény N = 12 esetén?', '1', '3', '20', '100', '', '', 'A', '2024_40.png', 2, 4, 4),
(363, 'Milyen tag-et kell használni a weboldalak táblázataiban a táblázat egy-egy fejléc\r\ncellájának meghatározására?', '<cell>', '<td>', '<head>', '<th>', '', '', 'D', '', 2, 4, 2),
(364, 'Az alábbiak közül melyik nem része egy HTML oldal szerkezetének?', 'header', 'body', 'caption', 'head', '', '', 'C', '', 2, 4, 2),
(365, 'Az alábbiak közül melyik nem része a HTML5 szemantikus szerkezetének?', 'header', 'main', 'nav', 'table', 'section', '', 'D', '', 2, 4, 2),
(366, 'Mi lesz az eredménye a css opacity:0.3; utasításnak, ha egy képre alkalmazzák?', 'semmi', 'a kép 30% ban átlátszó lesz', 'a kép fele részben átlátszó lesz', 'a kép 70% ban átlátszó lesz', '', '', 'D', '', 2, 4, 2),
(367, 'Az alábbiak közül melyik paraméter nem használható css-ben a háttér beállításainak\r\nmódosítására?', 'url(\"img_tree.png\");', 'no-repeat;', 'fixed', 'double', '', '', 'D', '', 2, 4, 2),
(368, 'CSS formázással szeretnék az oldalon egy képet középre igazítani úgy, hogy a\r\nkörnyező szövegektől külön sorba kerüljön. Mi kerüljön a display tulajdonság\r\nparaméterébe?', 'semmi', 'inline', 'block', 'inline-block', '', '', 'C', '', 2, 4, 2),
(369, 'Mire való egy HTML oldalon a meta tagbe elhelyezett viewport tulajdonság beállítása?', 'nincs hatása a megjelenítésre', 'segítségével az eszköz méretéhez igazíthatjuk a tartalmak méretét', 'beállíthatjuk vele az oldalak legfelső szintjét', 'különféle nézőpontokat definiálhatunk vele', '', '', 'B', '', 2, 4, 2),
(370, 'Az alábbi CSS méret meghatározó mértékegységek közül melyik függ a megjelenítő eszköz dpi felbontásától?', 'cm', 'px', 'pt', 'mm', '', '', 'B', '', 2, 4, 2),
(371, 'Az alábbiak közül melyik CSS szelektorral lehet hivatkozni az összes olyan\r\nbekezdésre, amik a div elemen belül helyezkednek el?', 'div, p', 'div p', 'div>p', 'div+p', '', '', 'B', '', 2, 4, 2),
(372, 'Mi az a Bootstrap?', 'BIOS beállítás, amivel meg lehet határozni a gép indításáért felelős eszközt', 'JS és CSS keretrendszer', 'Egy Boot manager program', 'Statikus weblapok készítéséhez használt segédprogram', '', '', 'B', '', 2, 4, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `felhasznalo_id` int(11) NOT NULL,
  `felhasznalo_nev` varchar(255) NOT NULL,
  `felhasznalo_jelszo` varchar(255) NOT NULL,
  `felhasznalo_rang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`felhasznalo_id`, `felhasznalo_nev`, `felhasznalo_jelszo`, `felhasznalo_rang`) VALUES
(5, 'Aa', '$2a$10$auhieAYn7dvRvnziq7bFHuNTcBVx/LMBUofF/wsbkz6rfTn95x6mO', 1),
(6, 'Admin', '$2a$10$FNoGv4HB.4kVETfdb2QvbegXOqNv2BNpXWCDwFKla.www/Qz0wMB.', 2),
(8, 'User', '$2b$10$6/h08PIcMvWwlzV66dNsaeMD5Vc/jq0q2N4p1IsvO5YrvZdP9VyxK', 1),
(9, 'Proba', '$2b$10$eAcFZ8OKIz8KgAzEGhsJxeZyLcNb4Lfe2bfgfTmygINASTzN9jCxq', 1),
(10, 'gg', '$2b$10$.AmZdgjyIr7QbCVvfLkTwO/Kd.FQ7DP4AZAjb4wgpt/8lorEXEd4.', 0);

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rang`
--

CREATE TABLE `rang` (
  `rang_id` int(11) NOT NULL,
  `rang_nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `rang`
--

INSERT INTO `rang` (`rang_id`, `rang_nev`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tema`
--

CREATE TABLE `tema` (
  `tema_id` int(11) NOT NULL,
  `tema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tema`
--

INSERT INTO `tema` (`tema_id`, `tema`) VALUES
(1, 'I. Információtechnológiai alapismeretek '),
(2, 'II. Frontend programozás'),
(3, 'III. Backend programozás '),
(4, 'IV. Szoftverfejlesztés és -tesztelés');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD PRIMARY KEY (`eredmeny_id`);

--
-- A tábla indexei `ev`
--
ALTER TABLE `ev`
  ADD PRIMARY KEY (`ev_id`);

--
-- A tábla indexei `feladat`
--
ALTER TABLE `feladat`
  ADD PRIMARY KEY (`feladat_id`),
  ADD KEY `feladat_tema` (`feladat_tema`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`felhasznalo_id`);

--
-- A tábla indexei `informacio`
--
ALTER TABLE `informacio`
  ADD PRIMARY KEY (`informacio_id`);

--
-- A tábla indexei `rang`
--
ALTER TABLE `rang`
  ADD PRIMARY KEY (`rang_id`);

--
-- A tábla indexei `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`tema_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `eredmenyek`
--
ALTER TABLE `eredmenyek`
  MODIFY `eredmeny_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT a táblához `ev`
--
ALTER TABLE `ev`
  MODIFY `ev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `feladat`
--
ALTER TABLE `feladat`
  MODIFY `feladat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `felhasznalo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `informacio`
--
ALTER TABLE `informacio`
  MODIFY `informacio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `rang`
--
ALTER TABLE `rang`
  MODIFY `rang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `tema`
--
ALTER TABLE `tema`
  MODIFY `tema_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
