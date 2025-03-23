/* elenco delle città che hanno più di tre sale*/
SELECT citta, count(*) as "Numero sale"
FROM sale
GROUP BY citta
HAVING count(*) > 1
ORDER BY count(*) DESC