SELECT Titolo
FROM Film
WHERE Film.CodFilm NOT IN
	(SELECT Proiezioni.CodF
	FROM Proiezioni, Sale
	WHERE Sale.Citta LIKE "%Pisa%"
	AND Proiezioni.CodS = Sale.CodSala
	)
	