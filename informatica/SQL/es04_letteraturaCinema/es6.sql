SELECT Autori.NomeAut, min(Romanzi.Anno), max(Romanzi.Anno)
FROM Romanzi, Autori
WHERE Autori.Nazione LIKE "%Regno Unito%"
AND Romanzi.NomeAut = Autori.NomeAut
GROUP BY Romanzi.NomeAut