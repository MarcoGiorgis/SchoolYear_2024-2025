SELECT games.games_year, city.city_name, games.season
FROM games, city, games_city
WHERE games.season LIKE "%Winter%"
AND games.id = games_city.games_id
AND city.id = games_city.city_id
ORDER BY games.games_year DESC