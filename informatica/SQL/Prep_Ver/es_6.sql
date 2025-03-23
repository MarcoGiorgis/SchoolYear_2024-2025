SELECT medal.medal_name, COUNT(*) AS "n_medaglie"
FROM region, person, person_region, competitor_event, games_competitor, medal
WHERE region.region_name LIKE "%Italy%"
AND region.id = person_region.region_id
AND person.id = person_region.person_id
AND games_competitor.person_id = person.id
AND competitor_event.competitor_id = games_competitor.id
AND competitor_event.medal_id = medal.id
GROUP BY medal.medal_name
ORDER BY n_medaglie DESC
