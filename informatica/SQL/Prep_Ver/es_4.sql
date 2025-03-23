SELECT person.full_name, event.event_name
FROM person, region, person_region, games_city, city, event, competitor_event, games, games_competitor
WHERE region.region_name like "%Italy%"
AND region.id = person_region.region_id
AND person.id = person_region.person_id
AND city.city_name like "%Torino%"
AND games.games_year = 2006
AND games.id = games_city.games_id
AND city.id = games_city.city_id
AND games_competitor.id = competitor_event.competitor_id
AND games_competitor.person_id = person.id
AND event.id = competitor_event.event_id