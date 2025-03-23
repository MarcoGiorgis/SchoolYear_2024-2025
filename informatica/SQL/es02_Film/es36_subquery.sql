SELECT DISTINCT Nome
FROM Attori
WHERE CodAttore IN (
    SELECT CodA
    FROM Recita
    WHERE CodF IN (
        SELECT CodFilm
        FROM Film
        WHERE Regista LIKE "%Charles%" AND AnnoProduzione < 1960
    )
) AND CodAttore NOT IN (
    SELECT CodA
    FROM Recita
    WHERE CodF IN (
        SELECT CodFilm
        FROM Film
        WHERE Regista LIKE "%Charles%" AND AnnoProduzione >= 1960
    )
)
