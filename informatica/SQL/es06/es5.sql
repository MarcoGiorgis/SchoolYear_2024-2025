SELECT Residenze.Via
FROM Residenze, Persone, Genitori
WHERE Genitori.CodFiglio LIKE "%GRGMRC06D02D205F%"
AND Persone.CodiceFiscale = Genitori.CodGenitore
AND Residenze.CodR = Persone.CodRes
AND Persone.Sesso = "M"

