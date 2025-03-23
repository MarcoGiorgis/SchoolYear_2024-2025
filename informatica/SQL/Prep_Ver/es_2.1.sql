SELECT count(*) AS "N_persone"
FROM region, person_region, person
WHERE person.gender = "F"
AND region.region_name LIKE "%Cuba%"
AND person_region.person_id = person.id
AND person_region.region_id = region.id