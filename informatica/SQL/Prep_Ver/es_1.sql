SELECT city.city_name
FROM city, games, games_city
WHERE games.games_year < 2000
AND games.season like "%Summer%"
AND games_city.city_id = city.id
AND games_city.games_id = games.id
ORDER BY games_year