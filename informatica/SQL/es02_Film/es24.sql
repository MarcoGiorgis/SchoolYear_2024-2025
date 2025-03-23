SELECT film.titolo, sum(proiezioni.incasso)
FROM film, proiezioni
WHERE film.codfilm = proiezioni.codf
AND film.genere LIKE "%Documentario%"
GROUP BY proiezioni.codf