SELECT DISTINCT Titolo
FROM Film, Recita
WHERE Film.Regista LIKE "%Charles%"
AND Film.CodFilm NOT IN (
	SELECT Recita.CodF
	FROM Recita, Attori
	WHERE Recita.CodA = Attori.CodAttore
	AND Attori.Nazionalita LIKE "%Italiana%"
	)