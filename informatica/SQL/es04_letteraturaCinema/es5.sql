SELECT Film.Titolo, Film.Regista, Film.Anno
FROM Film, Romanzi
WHERE Romanzi.Titolo LIKE "Robin Hood"
AND Romanzi.Titolo = Film.Titolo
AND Film.CodiceRom = Romanzi.CodiceR
