-- Restituire l'anno nel quale il maggior numero di studenti ha sostenuto l'esame di Geometria


SELECT year(e.data) as Anno FROM esami e
INNER JOIN corsi c ON c.codice=e.corso
WHERE c.nome = 'Geometria'
GROUP BY year(e.data)
ORDER BY count(*) DESC
LIMIT 1;