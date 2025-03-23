SELECT cognome, nome, count(*) as "numero operai", avg(stipendio) as "media stipendio"
FROM responsabili, sedeB
WHERE sedeB.codR = responsabili.codResp
GROUP BY sedeB.codR