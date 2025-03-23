/* 9- Il Codice ed il Nome dei docenti dei Corsi che non sono frequentati da nessuno studente */

SELECT DOCENTI.CodDocente, DOCENTI.NomeD
FROM DOCENTI, CORSI
WHERE DOCENTI.CodDocente = CORSI.CodDocente
AND CORSI.CodCorso NOT IN (
	SELECT CodCorso
	FROM FREQUENTA
	)