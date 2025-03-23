SELECT region.region_name, sum(person.weight) as "peso_tot"
FROM region, person, person_region
WHERE region.id = person_region.region_id
and person.id = person_region.person_id
GROUP BY region.region_name
ORDER BY peso_tot DESC