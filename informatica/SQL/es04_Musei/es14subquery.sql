SELECT 	DISTINCT Musei.nomeM
FROM Musei, Opere
WHERE Musei.citta LIKE "%Londra%"
AND Opere.codM = Musei.codM
AND Opere.coda IN (
	SELECT codA
	FROM Artisti2
	WHERE Artisti2.nomeA LIKE "%Tiziano%"
	)