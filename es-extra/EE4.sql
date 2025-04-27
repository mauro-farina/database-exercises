-- Elencare tutti i corsi per cui la media voti all'esame è superiore a 26

SELECT c.nome
FROM esami e
INNER JOIN corsi c ON c.codice=e.corso
GROUP BY e.corso
HAVING avg(e.voto) > 26;