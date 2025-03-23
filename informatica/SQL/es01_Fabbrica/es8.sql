SELECT a.codOperaio, a.sesso
FROM sedeA a LEFT JOIN sedeB b
ON a.codOperaio = b.codOperaio
WHERE b.codOperaio is NULL