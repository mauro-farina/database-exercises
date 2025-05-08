DELIMITER $$
CREATE FUNCTION cdl (matricola char(9))
RETURNS CHAR(4) DETERMINISTIC
BEGIN
	RETURN SUBSTRING(matricola, 1, 4);
END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION media_p(matricola char(9))
RETURNS float DETERMINISTIC
BEGIN
	DECLARE med_pond float;
	SELECT sum(c.cfu * e.voto) / sum(c.cfu)	INTO med_pond
	FROM esami e INNER JOIN corsi c
	ON e.corso = c.codice
	WHERE e.studente = matricola;
	RETURN (med_pond);
END $$
DELIMITER ;