SELECT * , "sedeA" as sede --aggiunge di quale sede appartiene
FROM sedeA
UNION  --operatore insiemistico di unione fa vedere solo righe distinte UNION ALL -> mette tutte le righe
SELECT * , "sedeB" as sede
FROM sedeB
️