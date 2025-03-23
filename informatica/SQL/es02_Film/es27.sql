SELECT sale.nome, sum(proiezioni.incasso)
FROM sale, proiezioni
WHERE sale.citta LIKE "%Cuneo%"
AND sale.codsala = proiezioni.cods
GROUP BY proiezioni.cods
HAVING sum(proiezioni.incasso) > 10
