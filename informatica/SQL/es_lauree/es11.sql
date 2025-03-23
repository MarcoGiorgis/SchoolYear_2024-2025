/* 11- Il CodCorso dei corsi seguiti solo da studenti che appartengono al Corso di Laurea Triennale
in SBC */

SELECT DISTINCT CodCorso
FROM FREQUENTA
WHERE CodCorso NOT IN (
	SELECT CodCorso
	FROM FREQUENTA, STUDENTI, CORSIDILAUREA
	WHERE FREQUENTA.Matricola = STUDENTI.Matricola
	AND STUDENTI.CorsoLaurea NOT LIKE "%SBC%"
	AND CORSIDILAUREA.CorsoLaurea = STUDENTI.CorsoLaurea
	AND CORSIDILAUREA.TipoLaurea LIKE "%L%"
	)