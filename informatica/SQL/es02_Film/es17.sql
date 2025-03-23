SELECT count(*) as "numero film", regista
FROM film
WHERE film.annoproduzione > 1990
GROUP BY film.regista