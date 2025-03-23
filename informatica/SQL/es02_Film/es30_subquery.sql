SELECT Titolo
FROM Film
WHERE Film.CodFilm NOT IN 
	(SELECT DISTINCT Proiezioni.CodF
	FROM Proiezioni
	WHERE Proiezioni.Incasso > 500
	)