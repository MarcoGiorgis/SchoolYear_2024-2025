SELECT b.*, cognome AS "cognome responsabile", nome AS "nome responsabile" 
FROM sedeB b, responsabili r
WHERE b.codR = r.codResp AND sesso = "F"
AND strftime("%Y", assuntoIl) = "2011" --prende solamente l'anno 2011