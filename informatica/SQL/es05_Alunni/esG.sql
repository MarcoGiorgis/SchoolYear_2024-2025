SELECT a.*, (alunno_media.media_voti - a.media_voti) AS differenza
FROM alunni as a, alunni as alunno_media
WHERE alunno_media.cognome = "Mastromatteo" AND alunno_media.nome = "Mino"
AND a.media_voti < alunno_media.media_voti
ORDER BY a.media_voti DESC