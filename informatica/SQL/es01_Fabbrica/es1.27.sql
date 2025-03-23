/*Codice e data assunzione degli operai/e della sede B del responsabile il cui
nome e cognome viene inserito da tastiera (fai la tabella supponendo di voler
conoscere le operaie di Fassa Maria) in ordine crescente di data di assunzione*/

SELECT codOperaio, assuntoIl
FROM sedeB, Responsabili
WHERE codR = codResp AND nome = "Maria" AND cognome = "Fassa"
ORDER BY assuntoIl 