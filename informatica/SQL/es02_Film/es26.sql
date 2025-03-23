SELECT film.titolo, sum(proiezioni.incasso)
FROM film, proiezioni
WHERE film.codfilm = proiezioni.codf
AND film.genere LIKE "%Documentario%"
AND strftime("%Y-%m-%d", proiezioni.dataproiezione) > "1-1-2001"
GROUP BY proiezioni.codf