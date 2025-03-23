SELECT Film.CodFilm, Film.Titolo, sum(incasso) as "IncassoTot" 
FROM Film, Proiezioni
WHERE Film.CodFilm = Proiezioni.CodF
AND Film.AnnoProduzione > 2000
GROUP BY Film.Titolo, Film.CodFilm
ORDER BY incassoTot DESC