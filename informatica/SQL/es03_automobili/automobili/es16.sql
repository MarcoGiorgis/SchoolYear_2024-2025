SELECT s.codS
FROM SINISTRI as s, PROPRIETARI as p, AUTO as a, AUTOCOINVOLTE as ac
WHERE s.codS = ac.codS
AND ac.targa = a.targa
AND a.codF = p.codF
AND s.localita = p.residenza