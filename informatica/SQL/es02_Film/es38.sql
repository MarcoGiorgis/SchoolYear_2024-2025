SELECT nome
FROM attori
LEFT JOIN film ON attori.nome = film.regista
WHERE codFilm IS NULL