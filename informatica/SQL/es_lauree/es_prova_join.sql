SELECT DOCENTI.NomeD
FROM DOCENTI
WHERE DOCENTI.Dipartimento LIKE "%Informatica%"
UNION 
SELECT STUDENTI.NomeS
FROM STUDENTI, DOCENTI, CORSI, FREQUENTA
WHERE DOCENTI.Dipartimento LIKE "%Informatica%"
AND STUDENTI.Matricola = FREQUENTA.Matricola
AND FREQUENTA.CodCorso = CORSI.CodCorso
AND DOCENTI.CodDocente = CORSI.CodDocente

/* I NOMI DELLE PERSONE DOCENTI DEL DIPARTIMENTO DI INFORMATICA CHE NON SONO ANCHE NOMI DEL DIPARTIMENTO DI LETTERE */
SELECT DOCENTI.NomeD
FROM DOCENTI di LEFT JOIN DOCENTI dl
ON di.NomeD = dl.NomeD
WHERE di.Dipartimento = "%Informatica%"
AND dl.Dipartimento = "%Lettere%"
AND dl.NomeD IS NULL 

/* I nomi dei docenti in comune tra info e lettere */
SELECT DOCENTI.NomeD
FROM DOCENTI di, DOCENTI dl
WHERE di.NomeD = dl.NomeD
AND di.Dipartimento = "%Informatica%"
AND dl.Dipartimento = "%Lettere%" 