SELECT a.codOperaio, a.sesso
FROM sedeA a LEFT JOIN sedeB b
ON a.codOperaio = b.codOperaio
WHERE b.codOperaio is NULL
UNION
SELECT b.codOperaio, b.sesso
FROM sedeB B LEFT JOIN sedeA a
ON b.codOperaio = a.codOperaio
WHERE a.codOperaio IS NULL