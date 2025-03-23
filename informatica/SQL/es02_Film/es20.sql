SELECT Film.Regista, Attori.Nome, count(*) as "numeroFilm" 
FROM Film, Attori, Recita
WHERE Film.CodFilm = Recita.CodF
AND Attori.CodAttore = Recita.CodA
GROUP BY Film.Regista, Attori.Nome, Attori.CodAttore