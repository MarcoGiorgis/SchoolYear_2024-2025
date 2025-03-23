SELECT nome
FROM attori a LEFT JOIN film f
ON a.nome = f.regista
WHERE f.regista IS NOT NULL