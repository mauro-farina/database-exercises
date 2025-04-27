-- Soluzione 1
SELECT * FROM professori p
LEFT OUTER JOIN corsi c ON p.matricola=c.professore 
WHERE c.nome IS NULL;

-- Soluzione 2
SELECT count(*) FROM professori
WHERE matricola NOT IN (
	SELECT DISTINCT professore
	FROM corsi
	WHERE professore IS NOT NULL -- Siccome ci sono corsi con professore "NULL", senza questa WHERE l'operatore NOT IN
    	-- per maggiori info: https://www.geeksforgeeks.org/how-to-use-null-values-inside-not-in-clause-in-sql/
);