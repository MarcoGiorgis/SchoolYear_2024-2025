SELECT titolo
FROM film, proiezioni, sale
WHERE sale.citta like "%Pisa%"
AND sale.codSala = proiezioni.codS
AND proiezioni.codF = film.codFilm
AND film.codFilm not in
    (select DISTINCT proiezioni.codf
    FROM sale, proiezioni
    WHERE sale.codSala = proiezioni.codS
    AND sale.citta not like "%Pisa%"
    )