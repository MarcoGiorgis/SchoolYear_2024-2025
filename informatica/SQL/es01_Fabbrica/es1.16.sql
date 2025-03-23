SELECT a.*, cognome, nome
FROM sedeA a, responsabili r
WHERE a.codR = r.codResp
