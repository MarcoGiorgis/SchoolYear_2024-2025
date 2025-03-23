CREATE VIEW "Migliori" AS 
SELECT a.*
FROM alunni as a, alunni as aR
WHERE a.id_rappresentante = aR.ID
AND a.media_voti < aR.media_voti