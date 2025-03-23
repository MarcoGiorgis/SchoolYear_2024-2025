SELECT targa
FROM AUTO as a
WHERE targa NOT IN (
	SELECT DISTINCT targa
	FROM AUTOCOINVOLTE as ac, SINISTRI as s
	WHERE ac.codS = s.codS
	AND strftime('%Y', S.DataIncidente) = strftime('%Y', date('now', '-1 year'))
	)