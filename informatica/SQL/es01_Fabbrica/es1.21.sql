SELECT cognome, nome
FROM sedeA b, responsabili r
WHERE b.codR = r.codResp AND codOperaio="UGUG"