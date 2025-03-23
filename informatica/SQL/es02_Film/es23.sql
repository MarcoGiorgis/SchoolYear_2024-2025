SELECT film.titolo, count(*) as "numAutori"
FROM film, attori, recita
WHERE recita.coda = attori.codattore
AND recita.codf = film.codfilm
GROUP BY recita.codf
HAVING attori.annonascita > 2002