SELECT count(*) as "Numero", m.citta
FROM Musei as m, Opere as o, Artisti as a
WHERE m.citta = "Londra"
AND a.nomeA != "Tiziano"
AND o.codM = m.codM
AND o.codA = a.codA
