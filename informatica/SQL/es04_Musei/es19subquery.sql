SELECT DISTINCT Musei.nomeM
FROM Musei, Opere
WHERE Musei.citta LIKE "%Londra%"
AND Opere.codM = Musei.codM
AND Opere.codA NOT IN (
	SELECT Artisti2.codA
	FROM Artisti2
	WHERE Artisti2.nazionalita LIKE "%Italia%"
	AND Artisti2.nomeA NOT LIKE "%Tiziano%"
	)