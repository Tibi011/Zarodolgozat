-- 1. Új táblázat a pontoknak
CREATE TABLE IF NOT EXISTS feladat_pont (
    pont_id INT AUTO_INCREMENT PRIMARY KEY,
    feladat_id INT NOT NULL,
    pontszam INT NOT NULL,
    FOREIGN KEY (feladat_id) REFERENCES feladat(feladat_id)
);

-- 2. Végigmegyünk minden feladaton, és kinyerjük a pontszámot
INSERT INTO feladat_pont (feladat_id, pontszam)
SELECT 
    feladat_id,
    CAST(
        REGEXP_SUBSTR(
            CONCAT(feladat_a, ' ', feladat_b, ' ', feladat_c, ' ', feladat_d, ' ', feladat_e, ' ', feladat_f),
            '[0-9]+(?=\\s*pont)'
        ) AS UNSIGNED
    ) AS pontszam
FROM feladat
WHERE 
    CONCAT(feladat_a, feladat_b, feladat_c, feladat_d, feladat_e, feladat_f)
    REGEXP '[0-9]+\\s*pont';

-- 3. A válaszokból eltávolítjuk a "2 pont", "3 pont" stb. részeket
UPDATE feladat
SET feladat_a = REGEXP_REPLACE(feladat_a, '\\s+[0-9]+\\s*pont\\.?', ''),
    feladat_b = REGEXP_REPLACE(feladat_b, '\\s+[0-9]+\\s*pont\\.?', ''),
    feladat_c = REGEXP_REPLACE(feladat_c, '\\s+[0-9]+\\s*pont\\.?', ''),
    feladat_d = REGEXP_REPLACE(feladat_d, '\\s+[0-9]+\\s*pont\\.?', ''),
    feladat_e = REGEXP_REPLACE(feladat_e, '\\s+[0-9]+\\s*pont\\.?', ''),
    feladat_f = REGEXP_REPLACE(feladat_f, '\\s+[0-9]+\\s*pont\\.?', '');
