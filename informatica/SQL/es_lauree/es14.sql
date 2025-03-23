/* 14- I corsi con il maggior numero di studenti iscritti */

SELECT CORSI.CodCorso, CORSI.NomeCorso
FROM CORSI, FREQUENTA
WHERE FREQUENTA.CodCorso = CORSI.CodCorso
GROUP BY FREQUENTA.CodCorso
HAVING COUNT(*) = (SELECT MAX(n)
	FROM (
		SELECT COUNT(*) AS n
		FROM FREQUENTA
		GROUP BY FREQUENTA.CodCorso
	)
)