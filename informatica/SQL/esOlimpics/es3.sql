SELECT region_name, full_name
FROM noc_region, person_region, games, games_city, city, person, games_competitor
WHERE noc_region.noc LIKE "%ITA%"
AND games.season LIKE "%Winter%"
AND games.games_year = 2006
AND city.city_name LIKE "%Torino%"
AND person_region.region_id = noc_region.id
AND person_region.person_id = person.id
AND games_city.city_id = city.id
AND games_city.games_id = games.id
AND games_competitor.games_id = games.id
AND games_competitor.person_id = person.id