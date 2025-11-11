# Rendszerterv

## 1. Bevezetés

A rendszer célja, hogy az OSZTV (Országos Szakmai Tanulmányi Verseny) papíralapú, PDF formátumban kiadott kérdőívét egy interaktív webes kérdőív formájában valósítsa meg.


## 2. Architektúra

Adatbázis: MySQL (phpMyAdmin kezelőfelülettel)
Backend: Node.js + Express.js
Frontend: React.js
Kommunikáció: JSON formátumban történik a frontend és backend között

## 3. Funkcionális köv.
Fő funkciók:

- OSZTV kérdőív megjelenítése és kitöltése a webes felületen

- Kitöltött adatok beküldése és tárolása adatbázisban

- Kérdések és válaszok feldolgozása, statisztikai elemzések előkészítése

- Távlati tervek:

- Automatikus kiértékelés megvalósítása

- Admin felület a kérdések és eredmények kezelésére

## 4. Nem funkcionális követelmények

1. A rendszer legyen reszponzív, mobil eszközökön is jól használható

2. Megfelelő hibakezelés és felhasználóbarát visszajelzések

3. Biztonságos adatkezelés (pl. űrlapadatok validálása)

4. Gyors betöltési idő és optimalizált adatlekérések

## 5. Adatbázis terv
### 5.1 Táblák

Felhasználo tábla:

- felhasznalo_id (PK)

- felhasznalo_nev

- email

Kérdés tábla:

- kerdes_id (PK)

- temakor

- kerdes_szoveg

- valasz_tipus (pl. szöveges, feleletválasztós)

Válasz tábla:

- valasz_id (PK)

- kerdes_id (FK)

- felhasznalo_id (FK)

- valasz_szoveg

Statisztika tábla:

- stat_id (PK)

- kerdes_id (FK)

- valaszok_szama

- helyes_valaszok_szama (ha releváns)

### 5.2 Kapcsolatok

Egy felhasználó több választ adhat 

Egy kérdéshez több válasz tartozhat 

A statisztika tábla a kérdésekhez kapcsolódik, és az adatok kiértékelését segíti

## 6. Adatáramlás
1. Kérdőív kitöltésének folyamata:

2. A felhasználó megnyitja az OSZTV kérdőív weboldalt

3. A frontend lekéri a kérdéseket a backendtől

4. A felhasználó kitölti az űrlapot

5. A „Beküldés” gomb megnyomásakor a frontend JSON formátumban elküldi az adatokat a backendnek

6. A backend validálja az adatokat, majd eltárolja azokat az adatbázisban

7. A sikeres mentés után visszajelzést küld a felhasználónak

8. Az adatok később statisztikai elemzésre is felhasználhatók