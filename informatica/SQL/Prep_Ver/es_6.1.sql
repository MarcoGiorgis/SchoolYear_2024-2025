SELECT medal.medal_name, count(*) as "num_medaglie"
FROM person, person_region, region, competitor_event, games_competitor, medal
WHERE region.region_name LIKE "%Italy%"
AND person_region.person_id = person.id
AND person_region.region_id = region.id
AND competitor_event.medal_id = medal.id
AND competitor_event.competitor_id = games_competitor.id
AND games_competitor.person_id = person.id
GROUP BY medal.medal_name
ORDER BY num_medaglie DESC