-- Elencare tutti i corsi per i quali nessuno ha passato l'esame a gennaio 2020


-- Soluzione 1
SELECT c.nome
FROM corsi c
WHERE c.codice NOT IN (
	SELECT e.corso FROM esami e
	WHERE year(e.data) = 2020 AND month(e.data) = 1
);


-- Soluzione 2
SELECT c.nome
FROM corsi c
LEFT OUTER JOIN (
	SELECT * FROM esami e
	WHERE year(e.data) = 2020 AND month(e.data) = 1
) AS tab ON c.codice=tab.corso
WHERE tab.voto IS NULL;


-- Soluzione 3
SELECT c.nome
FROM corsi c
LEFT OUTER JOIN esami e ON c.codice=e.corso 
	AND year(e.data) = 2020 AND month(e.data) = 1
WHERE e.voto IS NULL;