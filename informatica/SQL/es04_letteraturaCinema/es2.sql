SELECT Romanzi.Titolo, Autori.NomeAut, Romanzi.Anno
FROM Romanzi, Autori
WHERE Autori.Nazione = "Regno Unito"
AND Romanzi.NomeAut = Autori.NomeAut
GROUP BY Romanzi.NomeAut
ORDER BY Romanzi.NomeAut, Romanzi.Anno