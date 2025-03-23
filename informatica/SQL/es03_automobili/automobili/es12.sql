SELECT Nome
FROM ASSICURAZIONI
WHERE CodAss = (
    SELECT CodAss
    FROM AUTO
    WHERE CodAss IS NOT NULL
    AND CodAss IN (
        SELECT CodAss
        FROM AUTO A
        JOIN AUTOCOINVOLTE AC ON A.Targa = AC.Targa
        GROUP BY CodAss
        ORDER BY COUNT(DISTINCT AC.CodS) DESC
        LIMIT 1
    )
)