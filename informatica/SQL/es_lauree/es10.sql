/* 10- Matricola e nome degli studenti che seguono solo corsi di docenti del dipartimento di Storia */

SELECT STUDENTI.Matricola, STUDENTI.NomeS
FROM STUDENTI, FREQUENTA
WHERE FREQUENTA.Matricola = STUDENTI.Matricola
AND FREQUENTA.CodCorso IN (
SELECT CORSI.CodCorso
FROM CORSI, DOCENTI
WHERE CORSI.CodDocente = DOCENTI.CodDocente
AND DOCENTI.Dipartimento LIKE "%Storia%")
AND FREQUENTA.CodCorso NOT IN (
SELECT CORSI.CodCorso
FROM CORSI, DOCENTI
WHERE CORSI.CodDocente = DOCENTI.CodDocente
AND DOCENTI.Dipartimento NOT LIKE "%Storia%")


