SELECT Personaggi.NomeP
FROM Personaggi, Romanzi, Autori
WHERE Personaggi.Ruolo LIKE "%Protagonista%"
AND Autori.AnnoM IS NULL
AND Personaggi.CodiceR = Romanzi.CodiceR
AND Romanzi.NomeAut = Autori.NomeAut