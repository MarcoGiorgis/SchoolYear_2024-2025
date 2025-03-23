SELECT Opere.titolo, Artisti2.nomeA
FROM Opere, Artisti2
WHERE Opere.codA = Artisti2.codA
AND Artisti2.nazionalita LIKE "%Italia%"
AND Opere.codice NOT IN (
	SELECT codice
	FROM Personaggi
	)