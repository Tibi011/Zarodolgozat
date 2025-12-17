-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Dec 04. 09:32
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
  `feladat_ev` int(11) NOT NULL,
  `feladat_tema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `feladat`
--

INSERT INTO `feladat` (`feladat_id`, `feladat_kerdes`, `feladat_a`, `feladat_b`, `feladat_c`, `feladat_d`, `feladat_e`, `feladat_f`, `feladat_helyes`, `feladat_kep`, `feladat_ev`, `feladat_tema`) VALUES
(1, 'Egy elektromos berendezés kiválasztásánál szükséges lenne tudnunk, hogy mennyi annak \na maximális áramfelvétele. Az eszköz 110V -os feszültséget igényel és 22W teljesítményű. \nMennyi lesz az áramfelvétel?', 'a) 1 A', 'b) 1 mA', 'c) 200 mA', 'd) 100 μA  2 pont', '', '', 'C', '', 1, 0),
(2, 'Igaz-e a következő állítás? A feszültségmérőt a fogyasztóval sorosan kell bekötni az \náramkörbe.', 'a) A fenti állítás minden esetben hamis.', 'b) A fenti állítás minden esetben igaz.', 'c) A fenti állítás bizonyos esetekben hamis.', 'd) A fenti állítás bizonyos esetekben igaz.', 'e) A rendelkezésre álló adatok alapján nem eldönthető.   2 pont', '', 'A', '', 1, 0),
(3, 'Melyik alkatrész szolgál egy áramkörben az elektromos energia tárolására?', 'a) tranzisztor', 'b) kondenzátor', 'c) tekercs', 'd) dióda  2 pont', '', '', 'B', '', 1, 0),
(4, 'Milyen funkciót lát el az ellenállás egy áramkörben?', 'a) Stabilizálja a feszültséget.', 'b) Egyen irányítja  az áramot.', 'c) Tárolja az elektromos töltést.', 'd) Védelmet nyújt a túlfeszültség ellen.', 'e) Csökkenti az áram erősségét.  2 pont', '', 'E', '', 1, 0),
(5, 'Linus az operációs rendszerét melyik CPU -ra / gépcsaládra készítette el?', 'a) i286', 'b) i386', 'c) Alpha', 'd) Sparc', 'e) AMD  2 pont', '', 'B', '', 1, 0),
(6, 'Melyik ma is létező és aktívan fejlődő operációs rendszerre hasonlít leginkább a Linux?', 'a) Android', 'b) Linux', 'c) MacOS', 'd) Unix', 'e) Windows  2 pont', '', 'B,D', '', 1, 0),
(7, 'Melyik operációs rendszert vette alapul Torvalds  a Linux operációs rendszer \nkifejlesztéséhez?', 'a) iOS', 'b) IOS', 'c) MINIX', 'd) Unix', 'e) Windows  2 pont', '', 'C', '', 1, 0),
(8, 'Torvalds  operációs rendszere esetében melyik komponens felel a hardware elemek \nvezérléséért?', 'a) Kernel', 'b) GUI', 'c) CLI', 'd) Shell', 'e) BASH  2 pont', '', 'A', '', 1, 0),
(9, 'Egy 32 bites architektúra esetén mekkora a legnagyobb megcímezhető memória mérete?', 'a) 2 GB', 'b) 4 GB', 'c) 8 GB', 'd) 32 GB', 'e) 4 MB  2 pont', '', 'B', '', 1, 0),
(10, 'Hogy nevezzük a grafikai számításokra kifejlesztett műveletvégző egységet?', 'a) Core', 'b) CPU', 'c) GPU', 'd) Socket', 'e) VRAM  2 pont', '', 'C', '', 1, 0),
(11, 'Mely típusú csatlakozó nem alkalmas videójel átvitelére az alább felsoroltak közül?', 'a) BNC', 'b) DVI', 'c) HDMI', 'd) PS/2', 'e) RCA  2 pont', '', 'D', '', 1, 0),
(12, 'Mit jelent a partícionálás egy SSD típusú meghajtó esetében?', 'a) Különálló logikai tárolóegységet hozunk létre a meghajtón.', 'b) Különálló fizikai tárolóegységet hozunk létre a meghajtón.', 'c) Új szilárdtest tárolókat alakítunk ki a meghajtón.', 'd) Az SSD meghajtók fizikai szektorainak manuális átrendezése.', 'e) Az SSD meghajtók esetében nem engedélyezett.   2 pont', '', 'A', '', 1, 0),
(13, 'Mi a célja a preventív karbantartásnak?', 'a) Az eszközök teljesítményének növelése.', 'b) Az energiafogyasztás csökkentése.', 'c) Az eszközelemek gyorsabb cseréje.', 'd) A karbantartási költségek növelése.', 'e) A rendszerhiba kockázatának csökkentése.  2 pont', '', 'E', '', 1, 0),
(14, 'Mi a szerepe a por eltávolításának a számítógépek karbantartásában?', 'a) A szoftver teljesítményének javítása.', 'b) Az energiafogyasztás csökkentése.', 'c) A hűtés hatékonyságának fenntartása.', 'd) Az operációs rendszer gyorsítása.', 'e) A számítógép cseréjének elkerülése.   2 pont', '', 'C', '', 1, 0),
(15, 'Minek a rövidítése az IoT?', 'a) Internet of Things', 'b) Information of Technology', 'c) Information over Tunnel', 'd) Intelligence of Things', 'e) Internet of Technology  2 pont', '', 'A', '', 1, 0),
(16, 'A TCP/IP modell melyik rétegében működik az Ethernet?', 'a) Internet', 'b) Szállítási', 'c) Hozzáférési', 'd) Alkalmazási', 'e) Protokoll  2 pont', '', 'C', '', 1, 0),
(17, 'Egy 1  Mbps  átviteli sebességű hálózati kapcsolat 2 perc alatt (maximum) hány bit \nátvitelére képes?', 'a) 960.000.000', 'b) 480.000.000', 'c) 180.000.000', 'd) 120.000.000', 'e) 60.000.000  2 pont', '', 'D', '', 1, 0),
(18, 'Hány bájtos egy IPv6 -os cím?', 'a) 128', 'b) 48', 'c) 32', 'd) 16', 'e) 4 2 pont', '', 'D', '', 1, 0),
(19, 'Hogy nevezzük az olyan hálózatot, ahol nincs kitüntetett szerver -kliens szerepkör?', 'a) Point -to-Point', 'b) Point -to-Peer', 'c) Peer-to-Point', 'd) Peer -to-Peer', 'e) Single -to-Single  2 pont', '', 'D', '', 1, 0),
(20, 'Az alábbiak közül melyik magánhálózati cím az RFC 1918 szabvány szerint?', 'a) 12.212.100.3', 'b) 172.20.100.3', 'c) 172.15.100.3', 'd) 192.200.100.3', 'e) 192.169.100.3  2 pont', '', 'B', '', 1, 0),
(21, 'Melyik interface  teszi lehetővé egy második  réteg béli  kapcsoló távoli konfigurálását?', 'a) AUX', 'b) SVI', 'c) SVN', 'd) VPN', 'e) WAN  2 pont', '', 'B', '', 1, 0),
(22, 'Mi az IP címek kiosztásának leggyakoribb módja egy nagyvállalati hálózaton belül?', 'a) Egyetlen központi IP cím használata az egész hálózaton.', 'b) A statikusan beállított IP címek kézzel történő kiosztása.', 'c) Az IP címek Bluetooth -on keresztül történő kiosztása.', 'd) Az IP címek automatikus generálása a végponti eszközökön.', 'e) Automatikus, DHCP kiszolgáló által történő kiosztása.   2 pont', '', 'E', '', 1, 0),
(23, 'Mit csinál a switch , ha olyan keretet kap, amiben a célállomás MAC címe nem szerepel a \nMAC -cím táblájában?', 'a) Automatikusan hozzáadja a MAC címet a táblához, és továbbítja a keretet.', 'b) Eldobja a kapott keretet, mert nem tud vele mit kezdeni.', 'c) Kiküldi a kapott keretet minden portján  kivéve azt, amin az bejött.', 'd) Egy ARP kérést intéz a MAC cím kiderítésére.', 'e) Kiküldi a kapott keretet minden portján .  2 pont', '', 'C', '', 1, 0),
(24, 'A távoli felhasználóknak melyik megoldás nyújt biztonságos hozzáférést a céges \nhálózathoz?', 'a) A Virtual Private  Network (VPN) technika használata.', 'b) A cég irodájába telepített - L7-es szinten futó - tűzfal.', 'c) A jelszavak mellett valamelyik MFA technika használata.', 'd) A céges fájlok letöltése és tárolása az otthoni eszközökön.', 'e) A böngésző privát módban történő elindítása.   2 pont', '', 'A', '', 1, 0),
(25, 'Melyik biztonsági eszköz figyeli és riasztja a hálózati rendszergazdát az esetleges \ntámadásokról?', 'a) DHCP', 'b) DNS', 'c) IDS', 'd) SSL', 'e) VPN  2 pont', '', 'C', '', 1, 0),
(26, 'Melyik támadás célja, hogy túlterhelje a hálózatot, és elérhetetlenné tegye a \nszolgáltatásokat?', 'a) Adathalászat', 'b) Denial of Service', 'c) Man-in-the-Middle', 'd) Social Engineering', 'e) SQL injection  2 pont', '', 'B', '', 1, 0),
(27, 'Milyen típusú támadás során küld a támadó nagyszámú kérést a szervernek több \nszámítógépről, amelyek különböző földrajzi helyeken találhatók?', 'a) DNS mérgezés', 'b) DOS támadás', 'c) DDoS  támadás', 'd) Ping of Death', 'e) SYN elárasztás  2 pont', '', 'C', '', 1, 0),
(28, 'A felhőszolgáltatások típusai közül melyik az, amely a legalacsonyabb szolgáltatási szintet \nbiztosítja?', 'a) IaaS', 'b) MaaS', 'c) PaaS', 'd) RaaS', 'e) SaaS  2 pont', '', 'A', '', 1, 0),
(29, 'Hogy nevezzük a virtuális számítógépek futtatását végző programokat?', 'a) Desktop', 'b) Guest', 'c) Host', 'd) Hypervisor', 'e) Server  2 pont', '', 'D', '', 1, 0),
(30, 'Milyen felhőalapú megoldást választana, ha a lehető legrövidebb idő alatt szeretne \ninternetről elérhető tárhelyhez jutni?', 'a) SaaS', 'b) PaaS', 'c) IaaS', 'd) SaaR', 'e) SaaM  2 pont', '', 'A', '', 1, 0),
(31, 'Kinek a nevéhez köthető a HTML nyelv alapjainak kidolgozása?', 'a) Tim Berners -Lee (CERN)', 'b) Steve Jobs (Apple)', 'c) Bill Gates (Microsoft)', 'd) Larry Page (Google)', 'e) Linus Torvalds (Linux Foundation ) 3 pont', '', 'A', '', 1, 0),
(32, 'Melyik évtizedben született meg a  HTML nyelv?', 'a) 1960 -es évek – DARPA, ARPANET', 'b) 1970 -es évek – internet, TCP/IP', 'c) 1980 -as évek  – PC elterjedése', 'd) 1990 -es évek – világháló', 'e) 2000 -es évek – dotcom boom  3 pont', '', 'D', '', 1, 0),
(33, 'A \"böngészőháború\"  végére az Internet Explorer v ált a  domináns alkalmazás sá. Melyik \nböngésző  vesztette  el a piaci részesedését , és vált mára  szinte ismeretlenné ?', 'a) Apple Safari', 'b) Mozilla Firefox', 'c) Netscape Nagivator', 'd) Microsoft Edge', 'e) Opera  3 pont', '', 'C', '', 1, 0),
(34, 'A jelenlegi HTML5 az úgynevezett \" Living Standard \" része. Mikorra várható a \nkövetkező nagy kiadás a, esetleg ismert -e már annak a fantázia neve?', 'a) Az 5. 3 verziót  már m ost is használ juk, a Bootstrap számozását követi', 'b) A HTML6 határozatlan időre csúszik az AI technológiák miatt', 'c) Az új verzió neve PHTM L lesz, jelentése Python/PHP + HTML', 'd) A folyamatosan bővülő szabványnak  nem lesz több nagyverzió ja 3 pont', '', '', 'D', '', 1, 0),
(35, 'Melyik HTML5 -ben bevezetett szemantikus elemmel jelölhetjük az oldal fő tartalmát, \namely a dokumentum legfontosabb része?', 'a) < body  >', 'b) < main  >', 'c) < section class  = \"main\"  >', 'd) < div id  = \"content\"  > 3 pont', '', '', 'B', '', 1, 0),
(36, 'Egy szövegrészlet félkövér megjelenítésére néhány fejlesztő a <  b > taget, mások a \n< strong  > elemet használják. Valójában mi a különbség a két címke között?', 'a) Korábban volt köztük különbség, de ma már nincs jelentősége.', 'b) A < b > elem már nem szabványos, bár böngészők még támogatják', 'c) A < strong  > vizuális megjelenítésen túl szemantikai jelentéssel bír', 'd) A < strong  > csak a kód olvashatóságát javítja, mert nem rövidítés', 'e) A < strong  > elemmel tehetünk vastagabbá már félkövér <  b > elemet  3 pont', '', 'C', '', 1, 0),
(37, 'Milyen tag jelöli egy táblázat egyetlen fejléc celláját?', 'a) < head  >', 'b) < header  >', 'c) < thead  >', 'd) < th >', 'e) < td > 3 pont', '', 'D', '', 1, 0),
(38, 'Hogyan hozható létre hivatkozás az oldal „forrasok ” azonosítójú eleméhez?', 'a) < link href  = \"#forrasok\"  >', 'b) < link id  = \"forrasok\"  >', 'c) < href id  = \"forrasok\"  >', 'd) < a href  = \"forrasok\"  >', 'e) < a href  = \"#forrasok\"  > 3 pont', '', 'E', '', 1, 0),
(39, 'A <select>  választólistához milyen HTML taggel rendelhető választási lehetőségek ?', 'a) < label  >', 'b) < choice  >', 'c) < option  >', 'd) < input  >', 'e) < value  > 3 pont', '', 'C', '', 1, 0),
(40, 'Melyik szelektor színezi pirosra kizárólag a menüsorban szereplő hivatkozásokat?', 'a) a:nav { color: red; }', 'b) nav:a { color: red; }', 'c) nav a { color: red; }', 'd) nav.a { color: red; }', 'e) a.nav { color: red; }  3 pont', '', 'C', '', 1, 0),
(41, 'Hogyan  tudunk egy weboldal on minden  szöveget  Verdana  betűtípus úra állítani ?', 'a) html { font  : Verdana; }', 'b) html { text : Verdana; }', 'c) font { family  : Verdana; }', 'd) body { font -text : Verdana; }', 'e) body { font -family  : Verdana; }  3 pont', '', 'E', '', 1, 0),
(42, 'Melyik CSS szelektorr al tudunk kiválasztani egy olyan „div” elemet, ami rendelkezik  \n„mandatory ” osztállyal és „gdpr ” azonosító val?', 'a) div.mandatory #gdpr', 'b) div#mandatory .gdpr', 'c) div { .mandatory  { #gdpr {  … } } }', 'd) div { #mandatory  { .gdpr { … } } }', 'e) div class=\" mandatory \" id=\"gdp r\" 3 pont', '', 'A', '', 1, 0),
(43, 'Számos előnye lehet a Bootstrap keretrendszer CDN -en (Content Delivery Network ) \nkeresztül történő használatának. Az alábbiak közül melyik válasz téves ?', 'a) Csökkenthető  a hálózati forgalom a cache használata miatt', 'b) Általában alacsonyabb a válaszidő a közelebbi szervertől', 'c) Automatikus an hozzá férhetünk a legfrissebb verzióhoz', 'd) A gyorsítótár kihasználása javítja a betöltési időt  3 pont', '', '', 'C', '', 1, 0),
(44, 'A gutter  osztályt a Bootstrap 5.0 verziójában vezették be. De a s zintaktik ája hasonló a \nmargin vagy padding  osztály éhoz. Hogyan tudunk 5 egységnyi guttert  beállítani?', 'a) style  = \"gutter  : 5px;\"', 'b) . gutter { 5em  ; }', 'c) class  = \"gutter -5\"', 'd) class  = \"g-5\" 3 pont', '', '', 'D', '', 1, 0),
(45, 'Mi a szerepe  egy HTML oldalon a meta  tagbe n elhelyezett viewport  beállításnak ?', 'a) a reszponzív Bootstrap Rács  / Grid  csak így tud működni', 'b) az oldal  méretezés ért felel  különböző felbontású eszközökön', 'c) megállapítja, hogy az eszköz álló vagy fekvő elrendezésű', 'd) a keresőmotorok nál jobb rangsorolásá t biztosít', 'e) az oldal betűméreté t automatikus méretez i 3 pont', '', 'B', '', 1, 0),
(46, 'Milyen kódot nem  írhatunk JavaScriptben?', 'a) kliens oldalit', 'b) szerver oldalit', 'c) alacsony szintűt', 'd) magas szintűt', 'e) objektum -orientáltat  3 pont', '', 'C', '', 1, 0),
(47, 'Hogyan nevezzük a weboldal struktúráját reprezentáló  programozható modellt, ami \nlehetővé teszi szkriptek számára az oldal  elemeinek  elérését és módosítását?', 'a) AOM ( Application  Object  Model )', 'b) BOM ( Browser  Object Model)', 'c) COM ( Content Object Model )', 'd) DOM ( Document Object Model )', 'e) EOM (Element Object Model)  3 pont', '', 'D', '', 1, 0),
(48, 'Mi az az „ECMA Script ”, és mért jelentős az  ES6 verzió ja?', 'a) A JavaScript szabványa, a modern nyelvi elemek bevezetés ének kezdete', 'b) A JavaScript őse , ebből és a Java szavak  ötvözetéből származik a név', 'c) A JavaScript  következő verziója , ami t 2026-ra terveznek bevezetni', 'd) Egy frontend keretrendszer , ami a 6-os verzió óta piacvezető', 'e) Egy f rontend fejlesztő könyvtár , ami a 6 -os verzió óta piacvezető  3 pont', '', 'A', '', 1, 0),
(49, 'Melyik igaz a JavaScript változók típus osságára ?', 'a) szigorú  és statikus (fordítás kor kell meghatározni  és nem változhat )', 'b) gyeng e és dinamikus ( futási időben  az aktuálisan  tárolt  értéktől függ)', 'c) típusmentes (nincs jelentősége a változóban tárolt érték típusának)', 'd) multitípusos ( a tárolt értéknek  egyszerre  többféle  típusa  is lehet)', 'e) objektum -orientált ( a típusok valójában osztályok példányai)  3 pont', '', 'B', '', 1, 0),
(50, 'Melyik kulcsszó vezet be olyan változót, ami már a deklarációja előtt is használható \n(hoisting) , később is szabadon újra deklarálható,  és akár globális hatókörű  is lehet ?', 'a) let', 'b) var', 'c) const', 'd) Ez mindhárom kulcs szóra igaz', 'e) Semelyik nem  tudja ezeket együtt  3 pont', '', 'B', '', 1, 0),
(51, 'Melyik JavaScript metódus ad vissza  egy új tömböt az eredeti  változtatása nélkül ?', 'a) tomb . filter  ( )', 'b) tomb  . peek  ( )', 'c) tomb  . sort ( )', 'd) tomb  . clone  ( ) 3 pont', '', '', 'A', '', 1, 0),
(52, 'Melyik JavaScriptben létező metódus sal szúrhatunk  be új elemet a tömb elejére ?', 'a) . insert  ( 0 , érték )', 'b) . push ( 0 , érték )', 'c) . append ( érték )', 'd) . unshift  ( érték ) 3 pont', '', '', 'D', '', 1, 0),
(53, 'Milyen formátum ot ellenőrzi ez a reguláris kifejezés: ^[1-9][0-9]{2} [0 -9]{3} d{3}$', 'a) Telefonszám ot (061 234 567)', 'b) TAJ szám ot (123 456 789)', 'c) Személyiszám ot (123 456 AB)', 'd) Bankszámla számot  (1111  2222 opcionális 3333 4444) 3 pont', '', '', 'B', '', 1, 0),
(54, 'Mi lesz egy  „ for ... of ” ciklus eredménye a book  objektum bejárásakor ?', 'a) Típus hiba, mert az objektum nem iteráltható', 'b) Kulcs-érték pár ok ( \"year\" : 2024  )', 'c) Az objektum kulcsai  ( \"year\" )', 'd) Az objektum é rtékei ( 2024  )  3 pont', '', '', 'A', '2025_24.png', 1, 0),
(55, 'Mi lesz egy „ for  ... in ” ciklus eredménye a user objektum bejárásakor?', 'a) Undefined  értéke k, mert nem tud objektumot iterálni', 'b) Kulcs-érték pár ok ( \'id\' : 2024 )', 'c) Az objektum kulcsai ( \'id\' )', 'd) Az objektum értékei ( 2024 )  3 pont', '', '', 'C', '2025_25.png', 1, 0),
(56, 'Hogyan  iratkozhatunk fel egy „handler”  nevű függvénnyel arra  eseményre,  amit az  \noldal teljes tarta lmának betöl tése után vált ki az ablak ?', 'a) window . addEventListener ( \'on Loaded \' , handler  )', 'b) window . addEventListener ( \'load\' , handler )', 'c) window . load ed = handler', 'd) window . isReady  = handler  3 pont', '', '', 'B', '', 1, 0),
(57, 'Mire  használ juk a Promise  objektumot?', 'a) Ennek  segítségével  tudjuk elkerülni az aszinkron működést', 'b) A használatával kezelhetjük az async  kulcsszó kivételeit', 'c) Ezzel reprezentáljuk  egy jövőbeni művelet eredményé t', 'd) Egy aszinkron  függvénynek lehet vele paramétert átadni  3 pont', '', '', 'C', '', 1, 0),
(58, 'Melyik függvény  hívás ával tudunk egy szerverhez kérést intézni ?', 'a) http ( url )', 'b) get ( url )', 'c) fetch ( url )', 'd) request ( url )', 'e) response ( url )  3 pont', '', 'C', '', 1, 0),
(59, 'Milyen programozás i felületet használ egy alkalmazás ahhoz, hogy HTTP üzeneteken  \nkeresztül kérjen  adatot egy másik webes szolgáltatás tól?', 'a) SSH', 'b) SQL', 'c) CLI', 'd) GUI', 'e) API 3 pont', '', 'E', '', 1, 0),
(60, 'Melyik  nem egy tartalomkezelő -rendszer  (Content Management System / CMS )?', 'a) WordPress', 'b) Joomla !', 'c) Drupal', 'd) Ajax', 'e) SquareSpace  3 pont', '', 'D', '', 1, 0),
(61, 'Melyik  eszköz való  adatbázis ok tervezésének korai szakaszában  az objektumok  és \nkapcsolat aik vizuális ábrázolására , az implementációs megszorítások nélkül.', 'a) Struktogram', 'b) Relációs adatmodell', 'c) Entity Relationship  model l', 'd) Gantt-diagram', 'e) Venn -diagram  3 pont', '', 'C', '', 1, 0),
(62, 'Az alábbiak közül melyik  adatbázis -kezelő rendszer nem használ relációs modellt ?', 'a) MongoDB', 'b) MariaDB', 'c) MySQL', 'd) PostgreSQL', 'e) SQLite  3 pont', '', 'A', '', 1, 0),
(63, 'Hogyan adható meg egy adatbázis létrehozásakor, hogy a szövegek rendezése a magyar \nnyelv szabályait kövesse a kis - és nagybetűk mellőzésével?', 'a) ... CHARSET \'utf8\' LANG \'hu\' COLLATE \'ci\'', 'b) ... CHARSET \'utf8\' LANG \'hungarian\' CI', 'c) ... COLLATE \'utf8_hungarian\' NOT SENSITIVE', 'd) ... COLLATE \'utf8_hungarian_ci\'  3 pont', '', '', 'D', '', 1, 0),
(64, 'Mi a különbség a PRIMARY KEY és a UNIQUE megszorítások között?', 'a) Az egyik egy MySQL  megkötés,  a másik az MS SQL  megfelelője', 'b) A PRIMARY KEY nem kell, hogy egyedi legyen', 'c) A PRIMARY KEY nem lehet másik táblában idegen kulcs', 'd) A UNIQ UE mező k kitöltése nem kötelező', 'e) A UNIQ UE értékek nem kerülnek indexelésre  3 pont', '', 'D', '', 1, 0),
(65, 'Melyik D DL utasítással tudunk egy tábla szerkezetén módosítani?', 'a) UPDATE', 'b) ALTER', 'c) MODIFY', 'd) CREATE', 'e) TRUNCAT  3 pont', '', 'B', '', 1, 0),
(66, 'Melyik adattípus alkalmas nagy mennyiségű szöveg tárolására  a legtöbb SQL \nrendszerben?  (például legfeljebb 100.000 karakter hosszú blog  bejegyzés re)', 'a) BLOB', 'b) CHAR ( 100 .000 )', 'c) VARCHAR  ( 100 .000 )', 'd) TEXT', 'e) STRING  3 pont', '', 'D', '', 1, 0),
(67, 'Mihez nem adhatunk  álnevet ( alias )?', 'a) Egy adatbázis nak', 'b) Egy táblá nak', 'c) Egy mezőnek', 'd) Egy lekérdezésnek', 'e) Egy számítás eredményének  3 pont', '', 'A', '', 1, 0),
(68, 'Hogyan lehet  egy lekérdezett  mező értékéhez szöveget hozzáfűzni? ( Például a mérések \ntáblá ban a  távolság oszlop értékéhez a kilométer mértékegységet)', 'a) SELECT tavolsag  + \"km\" FROM meresek', 'b) SELECT \"{ tavolsag} km\" FROM meresek', 'c) SELECT JOIN ( tavolsag  , \"km\" )  FROM meresek', 'd) SELECT CONCAT ( tavolsag  , \"km\" )  FROM meresek', 'e) SELECT tavolsag  APPEND \"km\"  FROM meresek  3 pont', '', 'D', '', 1, 0),
(69, 'Hogyan  szűrhetünk a versenyzők között az első és második helyez ettekre ?', 'a) ... WHERE helyezes = 1 AND helyezes =  2', 'b) ... WHERE helyezes = 1 AND 2', 'c) ... WHERE helyezes = 1 OR 2', 'd) ... WHERE helyezes BEWEEN 0 AND 3', 'e) ... WHERE helyezes IN (1, 2)  3 pont', '', 'E', '', 1, 0),
(70, 'Melyik kulcsszó szűri ki egy mező ismétlődő értékeit a lekérdezés eredményéből ?', 'a) UNIQUE', 'b) DISTINC T', 'c) INDEX', 'd) NO REPEAT', 'e) NO DUPLICATE  3 pont', '', 'B', '', 1, 0),
(71, 'Milyen kifejezést kell írni a [ pattern  ] helyére, hogy  az összes olyan szakm a megnevezése \njelenjen meg a lekérdezésben, ami a „ tesztelő” szóra végződik?  \nSELECT * FROM szakmak WHERE megnevezes LIKE \" [ pattern ] \"', 'a) . tesztel ő', 'b) _ tesztelő', 'c) % tesztel ő', 'd) ? tesztel ő', 'e) * tesztel ő 3 pont', '', 'C', '', 1, 0),
(72, 'Melyik kifejezés  ellenőr izni, hogy egy mező  értéke  kitöltetlen?', 'a) IS EMPTY', 'b) NOT EMPTY', 'c) IS NULL', 'd) NOT NULL', 'e) IS NULL OR EMPTY  3 pont', '', 'C', '', 1, 0),
(73, 'Csoportosítás után milyen záradékkal tudunk tovább i szűrési feltételeket megadni ?', 'a) WHERE', 'b) FILTER', 'c) HAVING', 'd) GROUP BY', 'e) ORDER BY  3 pont', '', 'C', '', 1, 0),
(74, 'Melyik záradékkal lehet befolyásolni a megjelenített rekordok számát ?', 'a) LIMIT', 'b) MAX', 'c) TAKE', 'd) SKIP', 'e) OFFSET  3 pont', '', 'A', '', 1, 0),
(75, 'Melyik SQL JOIN típus választja ki azokat a rekordokat, amelyek mindkét táblában \nmegfelelnek a csatlakozási feltételnek?', 'a) FULL JOIN', 'b) LEFT JOIN', 'c) OUTER JOIN', 'd) INNER JOIN', 'e) CROSS JOIN  3 pont', '', 'D', '', 1, 0),
(76, 'Melyik  tervezési mintát alkalmazzuk, amikor  az alkalmazás  felépítését  a következő  \nrétegekre  osztjuk : Megjelenítés ↔ Vezérlő logika ↔ Adatállapotok', 'a) MVC', 'b) MVVM', 'c) REST', 'd) SOLID', 'e) SPA 3 pont', '', 'A', '', 1, 0),
(77, 'Egy rétegelt felépítésű alkalmazásban általában mi a „controller ” feladat a?', 'a) az alkalmazás adat ainak tárolása, módosítása,  kezel ése', 'b) a felhasználói felület megjelenítés e és elrendezése', 'c) az adatbáziskapcsolat és hálózati kommunikáció  fenntartása', 'd) a felhasználó által kezdeményezett műveletetek  fogadása és kezelése', 'e) az adatok ellenőrzése, a jogosultságok kezelése, naplózás  3 pont', '', 'D', '', 1, 0),
(78, 'Mi nem tartozik a „ ViewModel ” feladatai közé?', 'a) A megjelenítés t egyszerűsí ti, az adatkötés támogat ja', 'b) Események et és parancsok at közvetíti két réteg között', 'c) A tesztelhetőség  elősegítése , függetlenség  a megjelenítéstől', 'd) Egyetlen osztályba olvasztja a View és a Modell szerepeit  3 pont', '', '', 'D', '', 1, 0),
(79, 'Az alábbiak közül melyik nem backend fejlesztéséhez  használt  csomagkezelő ?', 'a) Npm  (Node .js)', 'b) Composer  (PHP)', 'c) NuGet (.NET)', 'd) jQuery  (JavaScript )', 'e) Gradle  (Java)  3 pont', '', 'D', '', 1, 0),
(80, 'Melyik nem egy HTTP kéréstípus?', 'a) GET', 'b) POST', 'c) PUT', 'd) UPDATE', 'e) DELETE  3 pont', '', 'D', '', 1, 0),
(81, 'Melyik nem egy HTTP válaszkód?', 'a) 604 Index Out of Range', 'b) 502 Bad Gateway', 'c) 418 I’m a teapot', 'd) 307 Temporary Redirect', 'e) 200 OK 3 pont', '', 'A', '', 1, 0),
(82, 'Mit nem tartalmaznak  egy HTTP kérés fejlé c információi ?', 'a) A kliensalkalmazás  adatait  (User -Agent: Mozilla/5.0 )', 'b) A kliens által preferált nyelveket (Accept -Language: hu -HU)', 'c) A kérés törzsének formátum át (Content -Type: application/json )', 'd) A HTTP metódus t és az URL -t (GET /index.html HTTP/1.1 )', 'e) A szervernek küldött cookie -kat (Cookie: sessionId= abc123) 3 pont', '', 'D', '', 1, 0),
(83, 'Melyik fogalom nem tartozik az CRUD műveletek közé?', 'a) adatok létrehozása', 'b) adatok ellenőrzése', 'c) adatok megtekintése', 'd) adatok módosítása', 'e) adatok eltávolítása  3 pont', '', 'B', '', 1, 0),
(84, 'Hogyan tárolja a REST kialakítású szerver a korábbi kérések állapotát?', 'a) cookie  fájlokban', 'b) session segítségével', 'c) socket  használatával', 'd) sehogyan, nem tárolja ezeket  3 pont', '', '', 'D', '', 1, 0),
(85, 'Melyik a javasolt  URL felépítés egy REST ful felület tervezésekor , ha a végpont tól \nkülönböző évek ben szervezett  versenyek indulóinak  eredmény ét kérhetjük el?', 'a) / getEredmeny  / 2025 / getVersenyzo  / 1', 'b) / eredmeny  / 2025  / versenyzo  / 1', 'c) / eredmeny  / ? ev = 2025  & id = 1', 'd) / getVersenyzoEredmeny  ? ev = 2025  & id = 1 3 pont', '', '', 'B', '', 1, 0),
(86, 'Melyik a legelterjedtebb leíró formátum webszolgáltatások között, ami mélyen \nstrukturált adatok tárolására képes könnyen olvasható alakban?', 'a) Markdown', 'b) XHTML', 'c) XAML', 'd) JSON', 'e) CSV  3 pont', '', 'D', '', 1, 0),
(87, 'Az ORM egy réteg et képez  az objektumorientált program és a relációs adatbázis között , \namivel hatékonyabbá válthat a fejlesztés . Melyik nem tartozik a z előnyei közé?', 'a) elfedi az eltérő adatbázis -kezelő rendszerek különbségeit', 'b) a táblá kat osztályokká  képezi le', 'c) képest kezel ni az osztályok között i 1:1, 1:N, N:N kapcsolatot', 'd) SQL utasítás ok kiváltható k példányok manipulálásával', 'e) garantálja  bonyolult  lekérdezések  optimális  futtatását  3 pont', '', 'E', '', 1, 0),
(88, 'Melyik nem egy ORM keretrendszer ?', 'a) Entity Framework (C# .NET)', 'b) Java Persistence API  (Java)', 'c) Postman ( REST API)', 'd) Eloquent (PHP, Laravel)', 'e) Sequelize  (Node.js)  3 pont', '', 'C', '', 1, 0),
(89, 'Hogyan nevezzük a technikát, amikor egy osztály függőségeit a konstruktor on keresztül \nadjuk át ? Például: public FelhasználóKezelő(IDatabase context) { }', 'a) Dependency Injection', 'b) SQL Injection', 'c) SQL Separation', 'd) Interface Implementation', 'e) Interface Inversion  3 pont', '', 'A', '', 1, 0),
(90, 'Mi az  az eszköz, am i automatikusan biztosítja egy objektum függősége it, amikor arra \nszükség van? Például : IDataBase  context  = Services.Resolve<IDataBase>();', 'a) Singleton', 'b) SQL Injector', 'c) Factory Pattern', 'd) IoC Container  3 pont', '', '', 'D', '', 1, 0),
(91, 'A Git alkotója az elnevezést a brit szlengből kölcsönözte. Önironikus utalásnak szánta \nsaját magára, mint csökönyös, rossz modorú emberre. Ki volt ő és milyen forráskód \nhatékonyabb kezelésére dolgozta ki?', 'a) Steve Jobs (Apple iOS)', 'b) Bill Gates (Microsoft Windows)', 'c) Linus Torvalds (Linux kernel)', 'd) Mark Zuckerberg (Facebook)  2 pont', '', '', 'C', '', 1, 0),
(92, 'Hogyan nevezzük azt a felépítést, amiben minden fejlesztő rendelkezik a projekt teljes \nállapotával, de egy központi szolgáltatón keresztül szinkronizálni is tudják a \nváltozásokat?', 'a) elosztott rendszer', 'b) centralizált rendszer', 'c) decentralizált rendszer', 'd) peer-to-peer rendszer  2 pont', '', '', 'A', '', 1, 0),
(93, '„Commit”  készítéséhez milyen adatok beállítása kötelező?', 'a) Username és Password', 'b) Username és Email', 'c) Personal Access Token', 'd) GitHub Account  2 pont', '', '', 'B', '', 1, 0),
(94, 'A fájlok fizikai tárolása szerint egy Git „repository” milyen két típusú lehet?', 'a) main / branch', 'b) public / private', 'c) local / remote', 'd) staged / unstaged', 'e) tracked / untracked  2 pont', '', 'C', '', 1, 0),
(95, 'Mivel azonosítja a Git rendszere a projekt egy adott pillanatban vett állapotát?', 'a) Timestamp', 'b) GUID', 'c) URI', 'd) URL', 'e) Hash  2 pont', '', 'E', '', 1, 0),
(96, 'Melyik utasítással tölthetők fel a helyi adattár bejegyzései egy távoli szolgáltatóhoz?', 'a) update', 'b) refresh', 'c) upload', 'd) push', 'e) pull 2 pont', '', 'D', '', 1, 0),
(97, 'Lehetséges -e klónozni egy idegen fejlesztő GitHubon található publikus projektjét?', 'a) Nem, de a fájlokat le lehet tölteni.', 'b) Igen, de csak ha meghívott kollaborációra.', 'c) Igen, ha van saját GitHub fiókunk.', 'd) Megkötések nélkül van rá lehetőség.  2 pont', '', '', 'D', '', 1, 0),
(98, 'Mi a „branch” szerepe  a fejlesztési folyamatban?', 'a) Nem tudnak konfliktusok kialakulni a verziók között.', 'b) Elősegíti a párhuzamos fejlesztést és a csapatmunkát.', 'c) A fejlesztők közös verzión dolgozhatnak egy időben.', 'd) Lehetővé teszi egy -egy fejlesztőnek az offline munkát.  2 pont', '', '', 'B', '', 1, 0),
(99, 'Hogyan nevezzük az eltérő ágak egyesítését, mindkét ág teljes történetének \nmegtartásával?', 'a) checkout', 'b) merge', 'c) sync', 'd) join 2 pont', '', '', 'B', '', 1, 0),
(100, 'Mi a célja GitHub platformon egy „ pull request ” küldésének?', 'a) A jogosultságok ellenőrzése változások letöltése nélkül.', 'b) A fejlesztőket szólíthatjuk fel a kódjuk feltöltésére.', 'c) A fejlesztőket szólíthatjuk fel az új verzió letöltésére.', 'd) A respository  tulajdonosa küldhet módosítási kérést fejlesztőknek.', 'e) A respository tulajdonosának küldhetünk módosítási javaslatot . 2 pont', '', 'E', '', 1, 0),
(101, 'Melyik az alábbiak közül a projektmenedzsment három legfontosabb eleme?', 'a) Idő - Költség - Terjedelem', 'b) Idő - Költség - Minőség', 'c) Kockázat - Kommunikáció - Motiváció', 'd) Képzés - Kommunikáció - Költség', 'e) Idő - Minőség - Erőforrás                  2 pont', '', 'A,B', '', 1, 0),
(102, 'Melyik nem egy projekt jellemzője?', 'a) célhoz kötött', 'b) komplex', 'c) automatikus', 'd) tervezett', 'e) változó  2 pont', '', 'C', '', 1, 0),
(103, 'Mi a projekt életciklusának második szakasza?', 'a) Végrehajtás', 'b) Ellenőrzés', 'c) Tervezés', 'd) Lezárás', 'e) Indítás                   2 pont', '', 'C,E', '', 1, 0),
(104, 'Projektmenedzsment során milyen diagramot használunk a tevékenységek időbeli \ntervezésére?', 'a) Oszlop diagram', 'b) Gantt diagram', 'c) Sávos diagram', 'd) Torta diagram', 'e) Idő diagram  2 pont', '', 'B', '', 1, 0),
(105, 'Melyik eszköz használható egy Kanban tábla egyszerű kezelésére és vizuális \nmegjelenítésére?', 'a) Jira', 'b) Figma', 'c) Teams', 'd) Trello', 'e) GitHub                      2 pont', '', 'A,D', '', 1, 0),
(106, 'Mit érdemes választani , mint megvalósítandó teszt cél ?', 'a) A rendszer m ár készítés közben is teljesen hibamentes legyen .', 'b) A rendszer az  éles indításkor teljesen hibamentes legyen .', 'c) Növeljük a megbízhatóságot, csökkentsük a kockázatot .', 'd) Ne legyenek teszteletlen bemenetek .', 'e) Ne legyenek teszteletlen kimenetek . 2 pont', '', 'C', '', 1, 0),
(107, 'Milyen okból mondhatjuk azt, hogy egy teszt „elkopott”?', 'a) Nem fut automatikusan, például  elavult  a keretrendszer .', 'b) Az eredeti célja már nem felel meg az aktuális kódbázisnak.', 'c) Nem dokumentálták megfelelően, idővel nem érthető, mit vizsgál .', 'd) A régóta nem futtatott teszteket  ignorálja a kere trendszer .             2 pont', '', '', 'B', '', 1, 0),
(108, 'Miért fontos felismerni a hibafürtök jelenségét?', 'a) Ezek azok a területek, ahol az automatikus tesztelés nem hatékony.', 'b) Egy adott modul hibái lokalizáltak maradnak, és nem terjednek tovább.', 'c) A hibák gyakran ugyan azon  a területen  halmozódnak.', 'd) A sok egységteszt  magától értetődően több hibát  mutat ki . 2 pont', '', '', 'C', '', 1, 0),
(109, 'Miért állítják  azt, hogy kimerítő teszt a valóságban nem lehetséges?', 'a) Túl sok  idő és erőforrás  lenne az összes esetet lefedni .', 'b) A tesztelési eszközök képtelenek  minden hibát feltárni.', 'c) A tesztkészletek nem frissülnek elég gyorsan a kód változásaihoz.', 'd) A tesztelés  dokumentá ciójába n is bármikor  előfordulhat  hiba. 2 pont', '', '', 'A', '', 1, 0),
(110, 'Melyik  tervezési modell nem tartalmazza egyáltalán a tesztelést, mint a szoftverfejlesztés \néletciklus ának  egy tevékenység ét?', 'a) szekvenciális  modellek  (pl. V-modell )', 'b) iteratív  modellek  (pl. Prototípus )', 'c) inkrementális  modellek  (pl. Scrum )', 'd) a fentiek közül egyik sem  tartalmazza', 'e) a fentiek közül mindegyik  tartalmazza  2 pont', '', 'E', '', 1, 0),
(111, 'Az agilis módszertanok és a DevOps  elterjedésével vált egyre inkább  elterjedté a  „shift -\nleft”  megközelítés . Mire helyezi ez a hangsúlyt?', 'a) A korai tesztelés  kerülendő, mert  lassítja a fejlesztők munkáját .', 'b) A hibák korai felismerés ét és megelőzés ét helyezi előtérbe .', 'c) Fejlesztők helyett dedikált  a tesztelők végzik a z ellenőrzését.', 'd) Dedikált tesztelők helyett maguk fejlesztők végzik  a tesztelést .', 'e) A tesztelést a megrendelő bevonásával kell végezni.  2 pont', '', 'B', '', 1, 0),
(112, 'Mit nevezünk  „statikus ” tesztelés nek? A kód tesztelését...', 'a) adatbázis -kapcsolat nélkül', 'b) megjelenítés i réteg  nélkül', 'c) a kód futtatás a nélkül', 'd) fordítás i környezet  nélkül', 'e) szintaktikai elemzés nélkül  2 pont', '', 'C', '', 1, 0),
(113, 'Mit tesztelünk „egységtesztek” során?', 'a) A teljes alkalmazást egyetlen osztatlan egységként  kezelve .', 'b) A legnagyobb egysége ket elkülönítve  (View , Logic , Model , stb.).', 'c) Az eltérő modulegységek együttműködését .', 'd) Osztályok függvényeit  és metódusait  izolált an.', 'e) Osztályok függőségeit . 2 pont', '', 'D', '', 1, 0),
(114, 'Mit vizsgálunk  „integrációs” tesztek  során ?', 'a) Egy függvény minden beme netre helyes eredmény ad.', 'b) Egy osztály megvalósít ja az összes  elvárt funkció ját.', 'c) Egy komponens helyesen működik más rendszerelemekkel .', 'd) Az alkalmazás  teljesíti  a felhasználói igényeket.  2 pont', '', '', 'C', '', 1, 0),
(115, 'Mire utal a tesztpiramisban a 10% -20% -70% -os „ökölszabály”?', 'a) A csapat összetételére (menedzser, tesztelő, fejlesztő)', 'b) Az időráfordításra (dokumentáció, tesztelés, fejlesztés)', 'c) Az időbeli ráfordításra (tervezés, tesztelés , implementáció )', 'd) A teszttípusok arányára ( rendszer , integrációs, egységteszt)  2 pont', '', '', 'D', '', 1, 0),
(116, 'Igaz-e a kijelentés , hogy a manuális tesztelést teljesen ki kell iktatni a modern \nszoftverfejlesztés  folyamatából ?', 'a) Igen, mert az automatizálás hatékonyabb és pontosabb .', 'b) Igen, mert csak emberi hibákat eredményez, így nincs valódi értéke.', 'c) Nem, de kizárólag kis projektek esetében van helye manuális tesztelésnek.', 'd) Nem, például a felhasználói élmény vizsgálatánál elengedhetetlen.', 'e) Nem, a manuális teszt a kreatív hibakeresési módszerek alapja.  2 pont', '', 'D', '', 1, 0),
(117, 'Mire utal az „AAA” minta ?', 'a) Három lépésre osztott tesztmegközelítésre.', 'b) A tesztkörnyezet inicializálásának, futtatásának és lezárásának mintájára.', 'c) A kiemelkedően magas megbízhatóságú tesztelésre .', 'd) A játékfejlesztésben használt módszertanokra.  2 pont', '', '', 'A', '', 1, 0),
(118, 'Mikor hasznos az @Before  vagy [SetUp]  annotációk használata egy tesztesetek et \nmegelőző metódusnál ?', 'a) Minden tesztesetnek azonos kiindulási állapotra van szüksége.', 'b) Minden tesztesetnek egyetlen közös en használat állapotra van szüksége.', 'c) Amikor a  tesztkörnyezet egyedi konfiguráció t igényel .', 'd) Amikor a  tesztesetek  egyedi  paraméterezésé t igényelnek . 2 pont', '', '', 'A', '', 1, 0),
(119, 'Mit jelent a TDD (Test -Driven Development)  megközelítés?', 'a) Szervezési irányelv. A csapat struktúrában a  tesztelő kap kiemelt hangsúlyt .', 'b) Fejlesztési módszertan. E lőbb írjuk meg a teszte ket, csak utána a kódot .', 'c) Tesztelési stratégia . Kizárólag automatikus teszteket használunk.', 'd) Fejlesztési filozófia. A kódot a tesztek működéséhez igazítjuk.  2 pont', '', '', 'B', '', 1, 0),
(120, 'Melyik helyzetben hasznos a  valós objektumokat helyettesítő  „Mock ”, „Fake”  vagy \n„Stub”  technik ák alkalm azása?', 'a) Egy API válasz  idejét teszteljük, a valódi szolgáltatás elérése nélkül.', 'b) Az adatbázis skálázhatóságát teszteljük valós környezetben.', 'c) Egy rendszer teljesítményét teszteljük szimulált forgalommal .', 'd) Egy külső erőforrást nem kívánunk a tesztelés során elérni.  2 pont', '', '', 'D', '', 1, 0);

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
-- AUTO_INCREMENT a táblához `ev`
--
ALTER TABLE `ev`
  MODIFY `ev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `feladat`
--
ALTER TABLE `feladat`
  MODIFY `feladat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `felhasznalo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
