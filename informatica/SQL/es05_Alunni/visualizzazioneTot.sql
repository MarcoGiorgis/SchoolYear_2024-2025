SELECT a.*, rappresentanti.nome as nome_rappresentante, rappresentanti.cognome as cognome_rappresentante
FROM alunni as a, alunni as rappresentanti
WHERE a.id_rappresentante = rappresentanti.id
