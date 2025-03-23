/* 12- Nome e CodDocente dei docenti che insegnano solo corsi seguiti da più di 5 studenti */

SELECT DISTINCT DOCENTI.NomeD, DOCENTI.CodDocente
FROM DOCENTI, CORSI, FREQUENTA
WHERE CORSI.CodDocente = DOCENTI.CodDocente
AND FREQUENTA.CodCorso = CORSI.CodCorso
AND CORSI.CodCorso  NOT IN (
	SELECT DISTINCT CORSI.CodCorso
	FROM FREQUENTA, CORSI
	WHERE FREQUENTA.CodCorso = CORSI.CodCorso
	GROUP BY FREQUENTA.CodCorso
	HAVING COUNT(*) < 1
	)
