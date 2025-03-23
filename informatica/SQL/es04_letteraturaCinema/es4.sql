SELECT Romanzi.Titolo
FROM Romanzi, Film
WHERE Film.Titolo = Romanzi.Titolo
AND Film.CodiceRom = Romanzi.CodiceR