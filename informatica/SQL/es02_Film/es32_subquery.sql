SELECT DISTINCT Nome
FROM Attori
WHERE Attori.Nazionalita LIKE "%Italiana%"
AND Attori.CodAttore NOT IN 
	(SELECT Recita.CodA
	FROM Recita, Film
	WHERE Recita.CodF = Film.CodFilm
	AND Film.Regista LIKE "%Charles%"
	)