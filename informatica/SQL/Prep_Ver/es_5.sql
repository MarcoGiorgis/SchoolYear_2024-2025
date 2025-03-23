SELECT region.region_name, count(*) as "n_ori"
FROM region, person, competitor_event, person_region, games_competitor
WHERE competitor_event.medal_id = 1
AND competitor_event.competitor_id = games_competitor.id
AND games_competitor.person_id = person.id
AND region.id = person_region.region_id
AND person.id = person_region.person_id
GROUP BY region.region_name
ORDER BY n_ori DESC