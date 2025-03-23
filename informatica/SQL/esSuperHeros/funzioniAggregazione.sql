/*quanti superhero ci sono nel db*/
/*FUNZIONI DI AGGREGAZIONE*/
--testare il risultato con SELECT *
--group by accorpa i valori uguali di una colonna
/*
SELECT count(*) as Maschi
FROM superhero
WHERE gender_id = 1  lavoro sul singolo dato di ricerca*/
/*
SELECT gender.gender, count(*)
FROM superhero, gender
WHERE superhero.gender_id = gender.id
GROUP BY gender_id
*/
SELECT colour.colour, count(*), superhero.superhero_name
FROM superhero, colour
WHERE superhero.eye_colour_id = colour.id
AND superhero.superhero_name LIKE "%bat%"
GROUP BY eye_colour_id
HAVING count(*) > 2
