/*elenco degli operai della sede B assunti nel 2011 da quello assunto più recentemente a quello assunto per primo*/
 
SELECT *
FROM sedeB
WHERE strftime("%Y", assuntoIl) = "2011"
ORDER BY assuntoIl DESC