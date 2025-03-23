SELECT Autori.Nazione, count(*) AS "autoriVivi"
FROM Autori
WHERE Autori.AnnoM IS NOT NULL
GROUP BY Autori.Nazione
ORDER BY count(Autori.Nazione) DESC
UNION ALL
SELECT Autori.Nazione, count(*) AS "autoriMorti"
FROM Autori
WHERE Autori.AnnoM IS NOT NULL
GROUP BY Autori.Nazione
ORDER BY count(Autori.Nazione) DESC