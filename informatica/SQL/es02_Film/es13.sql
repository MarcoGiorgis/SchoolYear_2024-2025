SELECT count(*) as "Num sale con 60 posti"
FROM sale 
WHERE sale.Citta = "Pisa"
AND sale.Posti > 60 