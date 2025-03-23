SELECT *
FROM sedeB B LEFT JOIN sedeA a
ON b.codOperaio = a.codOperaio
WHERE a.codOperaio IS NULL