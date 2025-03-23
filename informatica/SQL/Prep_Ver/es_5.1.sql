SELECT region.region_name, count(*) as "num_ori"
FROM region, person, person_region, competitor_event, games_competitor, medal
WHERE medal.medal_name LIKE "%Gold%"
AND person_region.person_id = person.id
AND person_region.region_id = region.id
AND competitor_event.medal_id = medal.id
AND competitor_event.competitor_id = games_competitor.id
AND games_competitor.person_id = person.id
GROUP BY region.region_name
ORDER BY "num_ori" DESC