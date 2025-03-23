SELECT Titolo
FROM Film
WHERE Film.CodFilm IN 
	(SELECT Recita.CodF
	FROM Recita
	WHERE Recita.CodA IS NULL)