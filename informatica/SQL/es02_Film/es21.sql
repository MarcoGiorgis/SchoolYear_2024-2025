SELECT Regista, Titolo, count(*) as "numeroFilm"
FROM Attori, Film, Recita
WHERE Attori.CodAttore = Recita.CodA
AND Film.CodFilm = Recita.CodF
GROUP BY Regista, Titolo, CodFilm
HAVING numeroFilm < 6