SELECT 
    R.Titolo AS TitoloRomanzo,
    COUNT(CASE WHEN P.Sesso = 'm' THEN 1 END) AS NumeroMaschili,
    COUNT(CASE WHEN P.Sesso = 'f' THEN 1 END) AS NumeroFemminili
FROM 
    Romanzi R, Personaggi P
WHERE R.CodiceR = P.CodiceR
GROUP BY 
    R.Titolo, P.Sesso;
