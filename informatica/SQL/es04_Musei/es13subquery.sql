SELECT DISTINCT nomeM
FROM Musei, Opere
WHERE citta LIKE "%Londra%"
AND Opere.codM = Musei.codM
AND Opere.codM NOT IN (
	SELECT Opere.codM
	FROM Opere, Artisti2
	WHERE Artisti2.nomeA LIKE "%Tiziano%"
	AND Opere.codA = Artisti2.codA
	)