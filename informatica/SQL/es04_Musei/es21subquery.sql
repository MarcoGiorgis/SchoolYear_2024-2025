SELECT Musei.nomeM
FROM Musei
WHERE Musei.codM IN (
    SELECT Opere.codM
    FROM Opere
    WHERE Opere.codA IN (
        SELECT Artisti.codA
        FROM Artisti
        WHERE Artisti.nazionalita LIKE "%Italia%"
    )
    GROUP BY Opere.codM
    HAVING COUNT(*) = (
        SELECT MAX(NumOpere)
        FROM (
            SELECT Opere.codM, COUNT(*) AS NumOpere
            FROM Opere
            WHERE Opere.codA IN (
                SELECT Artisti.codA
                FROM Artisti
                WHERE Artisti.nazionalita LIKE "%Italia%"
            )
            GROUP BY Opere.codM
        ) AS conteggio
    )
)
