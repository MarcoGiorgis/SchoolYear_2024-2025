SELECT Titolo
FROM Film, Attori, Recita
WHERE Attori.CodAttore = Recita.CodA
AND Recita.CodF = Film.CodFilm
AND nome LIKE "%Marco%" AND Film.CodFilm IN (
	SELECT Recita.CodF
	FROM attori, Recita
	WHERE Attori.CodAttore = Recita.CodA
	AND Nome LIKE "%Brama%")