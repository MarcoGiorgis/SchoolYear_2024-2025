SELECT DISTINCT Titolo
FROM Film, Proiezioni
WHERE Film.CodFilm = Proiezioni.CodF
AND Proiezioni.Incasso > 500
AND Film.CodFilm NOT IN 
	(SELECT DISTINCT Proiezioni.CodF
	FROM Proiezioni
	WHERE Proiezioni.Incasso <= 500
	)