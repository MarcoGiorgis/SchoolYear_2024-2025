/*
SELECT race.race, sum(superhero.weight_kg)
FROM superhero, race
WHERE superhero.race_id = race.id
GROUP BY superhero.race_id

SELECT avg(superhero.height_cm)
FROM superhero
*/

SELECT race.race, avg(superhero.height_cm)
FROM superhero, race
WHERE race.race LIKE "%Saiyan%"
AND superhero.race_id = race.id
