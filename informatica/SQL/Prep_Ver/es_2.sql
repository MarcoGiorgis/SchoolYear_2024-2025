SELECT count(*)
FROM person, region, person_region
WHERE person.gender like "F"
AND region.region_name like "%Cuba%"
AND region.id = person_region.region_id
and person.id = person_region.person_id