SELECT * --DISTINCT -> prende i campi con valore diverso
FROM sedeA
WHERE sesso = "M"
ORDER BY codR, codOperaio  --DESC -> decrescente
