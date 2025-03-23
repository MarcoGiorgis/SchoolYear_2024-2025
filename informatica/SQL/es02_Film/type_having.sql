SELECT titolo, count(*) as "Numero di attori"
FROM film, recita
WHERE codFilm = codF
GROUP  BY titolo, codFilm
HAVING count(*)>1 --permette la condizione sul count