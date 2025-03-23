SELECT DISTINCT Attori.Nome
FROM Attori, Recita
WHERE Recita.CodA = Attori.CodAttore
AND Recita.CodA IN (
	SELECT Attori.CodAttore
	FROM Attori, Film, Recita
	WHERE Film.Regista LIKE "%CR7%"
	AND Film.AnnoProduzione < 2050
	AND Attori.CodAttore = Recita.CodA
	AND Film.CodFilm = Recita.CodF
	)