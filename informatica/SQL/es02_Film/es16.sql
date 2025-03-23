SELECT count(*) as "Numero di sale"
FROM sale
WHERE sale.posti > 60
GROUP BY sale.citta