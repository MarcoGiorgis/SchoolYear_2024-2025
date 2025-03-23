SELECT Film.Regista, sum(proiezioni.incasso) as "incasso"
FROM Film, Proiezioni
WHERE Film.CodFilm = Proiezioni.CodF
GROUP BY Film.Regista