-- Chi è lo studente/ssa con media voti ponderata più alta di ciascun corso di laurea (cdl)?

-- 1
CREATE VIEW bravura_per_cdl AS
SELECT s.matricola, s.nome, s.cognome, substring(s.matricola, 1, 4) AS cdl, sum(e.voto * c.cfu) / sum(c.cfu) AS media
FROM studenti s
INNER JOIN esami e ON e.studente = s.matricola
INNER JOIN corsi c ON c.codice = e.corso
GROUP BY s.matricola;

-- 2
SELECT b1.cdl, b1.nome, b1.cognome
FROM bravura_per_cdl b1
WHERE b1.media = (
	SELECT max(b2.media)
    FROM bravura_per_cdl b2
	WHERE b2.cdl = b1.cdl
);