SELECT count(*), ge.genre_name --restituisce il numero di elementi ricercati
FROM game ga, genre ge
WHERE ga.genre_id = ge.id AND ge.genre_name LIKE "%S%" -- like per cercare parole simili
--dove trova una esse in qualisisi parte della parola
--%s -> soltanto con s finale
