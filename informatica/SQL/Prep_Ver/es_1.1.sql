SELECT city.city_name
FROM city, games, games_city
WHERE games.season LIKE "%Summer%"
AND games.games_year <= 2000
AND games_city.city_id = city.id
AND games_city.games_id = games.id
ORDER BY games.games_year