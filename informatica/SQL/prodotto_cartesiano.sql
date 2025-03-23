SELECT b.*, cognome AS "cognome responsabile", nome AS "nome responsabile" --prende solo cognome e nome della tab responsabili
FROM sedeB b, responsabili r
--fa le combinazioni di tutte le righe delle tabelle selezionate
--tabelle relazionali DataBase di tipo relazionale
--la riga della tabella viene chiamata tupla 
--il numero di colonne si chiama il grado
--il numero delle righe si chiama cardinalità 
--l'insieme di tutte le colonne e righe si chiama istanza
--prodotto cartesiano operatore insiemistico tra tabelle relazionali
--la tabella risultato del prodotto cartesiano avrà un grado uguale alla somma dei gradi delle tabelle di partenza
--è il prodotto della cardinalità
WHERE b.codR = r.codResp AND sesso = "F"--operazione di congiunzione (operatore relazionale) prende l'unica riga che interessa ed è giusta (join)
AND strftime("%Y", assuntoIl) = "2011" --prende solamente l'anno 2011


--SCHEMA RELAZIONALE
--	sottolineato -> chiave primaria
-- 	corsivo o con * -> chiave esterna