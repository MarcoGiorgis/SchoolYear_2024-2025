SELECT noc_region.region_name, count(*) as "NumOri"
FROM noc_region, person_region, games_competitor, medal, competitor_event
WHERE medal.medal_name LIKE "%Gold%"
AND competitor_event.medal_id = medal.id
AND competitor_event.competitor_id = games_competitor.id
AND person_region.person_id = games_competitor.person_id
AND person_region.region_id = noc_region.id
GROUP BY noc_region.region_name
ORDER BY "NumOri" DESC