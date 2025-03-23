/*13- Codice dei corsi che sono frequentati da tutti gli studenti del CorsoLaurea SBC*/

SELECT c.CodCorso
FROM Corsi c, Frequenta F, Studenti S
WHERE S.Matricola = F.Matricola
AND C.CodCorso = F.CodCorso
AND S.corsoLaurea = "SBC"
GROUP BY F.codcorso
HAVING COUNT(*) = (SELECT count(*)
	FROM Studenti
	WHERE corsoLaurea = "SBC"
)
