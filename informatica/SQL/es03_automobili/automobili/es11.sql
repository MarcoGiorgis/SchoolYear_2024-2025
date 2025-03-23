SELECT DISTINCT s.codS
FROM SINISTRI as s
WHERE s.codS NOT IN (
	SELECT ac.codS
	FROM AUTO as a, AUTOCOINVOLTE as ac
	WHERE a.targa = ac.targa
	AND a.cilindrata < 2000)