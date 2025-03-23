SELECT noc_region.region_name, count(*) as "NumAltleti"
FROM noc_region, person_region, person
WHERE person_region.region_id = noc_region.id
AND person_region.person_id = person.id
GROUP BY noc_region.region_name
ORDER BY "NumAltleti" DESC
