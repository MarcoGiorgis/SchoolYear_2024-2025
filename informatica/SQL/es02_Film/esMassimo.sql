SELECT Titolo, max(Proiezioni.incasso) AS incassomax
FROM Film, Proiezioni
WHERE Film.CodFilm = Proiezioni.CodF
GROUP BY Film.CodFilm, Titolo
HAVING incassomax = (
	SELECT max(Proiezioni.incasso) 
	FROM Proiezioni
	)
ORDER BY incassomax DESC LIMIT 1 --va vedere solo i primi tre