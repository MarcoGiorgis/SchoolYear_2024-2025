SELECT Film.Titolo, Film.Regista, count(*) as "numProiezioni", sum(proiezioni.incasso) as "incasso"
FROM Film, Proiezioni, Sale
WHERE Film.CodFilm = Proiezioni.CodF
AND Sale.CodSala = Proiezioni.CodS
AND Film.Regista LIKE "%CR7%"
AND Sale.Citta LIKE "%pisa%"
GROUP BY Film.Titolo
--HAVING numProiezioni > 0