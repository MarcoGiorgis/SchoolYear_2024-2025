SELECT region.region_name, sum(person.weight) as "Peso"
FROM person, person_region, region
WHERE person_region.person_id = person.id
AND person_region.region_id = region.id
GROUP BY region.region_name
ORDER BY "Peso" DESC