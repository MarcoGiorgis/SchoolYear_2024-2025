SELECT s.superhero_name, s.full_name, g.gender, c_occhi.colour, c_capelli.colour, c_skin.colour, r.race, p.publisher_name, a.alignment, s.height_cm, s.weight_kg, sp.power_name
FROM superhero s, gender g, colour AS c_occhi, colour AS c_capelli, colour AS c_skin, race r, publisher p, alignment a, superpower sp 
WHERE s.gender_id = g.id 
AND s.superhero_name LIKE "%gok%"
AND s.eye_colour_id = c_occhi.id
AND s.hair_colour_id = c_capelli.id
AND s.skin_colour_id = c_skin.id
AND s.race_id = r.id
AND s.publisher_id = p.id
AND s.alignment_id = a.id
