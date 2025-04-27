-- Se 1 CFU corrisponde a 8 ore di lezione, qual è il professore che passa meno tempo a insegnare?


SELECT concat(p.nome, ' ', p.cognome) as Professore, sum(c.cfu*8) AS Tot_Ore
FROM corsi c
INNER JOIN professori p ON c.professore=p.matricola
GROUP BY c.professore
ORDER BY sum(c.cfu)
LIMIT 1;