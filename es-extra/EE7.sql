-- Creare la stored procesure sp_trend_esame [...]

DELIMITER $$
CREATE PROCEDURE sp_trend_esame(IN COD_CORSO char(5))
BEGIN
	SELECT s.nome, s.cognome, "Sopra" as Trend
	FROM studenti s
	INNER JOIN esami e ON e.studente=s.matricola AND e.corso=COD_CORSO
	WHERE e.voto > (SELECT avg(ee.voto) FROM esami ee WHERE ee.corso=COD_CORSO)
	UNION
	SELECT s.nome, s.cognome, "Sotto"
	FROM studenti s
	INNER JOIN esami e ON e.studente=s.matricola AND e.corso=COD_CORSO
	WHERE e.voto < (SELECT avg(ee.voto) FROM esami ee WHERE ee.corso=COD_CORSO)
	UNION
	SELECT s.nome, s.cognome, "Uguale"
	FROM studenti s
	INNER JOIN esami e ON e.studente=s.matricola AND e.corso=COD_CORSO
	WHERE e.voto = (SELECT avg(ee.voto) FROM esami ee WHERE ee.corso=COD_CORSO);
END $$
DELIMITER ;