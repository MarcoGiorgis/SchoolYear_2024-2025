SELECT count(*)
FROM sedeA, responsabili
WHERE sedeA.sesso = "F"  
AND responsabili.nome = "Ivo"
AND responsabili.cognome = "Lerda"
AND sedeA.codR = responsabili.codResp