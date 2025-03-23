SELECT sedeA.*, cognome, nome
FROM sedeA, responsabili
WHERE responsabili.nome = "Ivo" AND responsabili.cognome = "Lerda"
AND sedeA.codR = responsabili.codResp
ORDER BY assuntoIl DESC