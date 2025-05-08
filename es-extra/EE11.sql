-- Scrivere un trigger che, nel momento in cui viene inserito un corso 
-- scoperto (cioè senza un professore associato), lo assegna ad un prof. 
-- che non ha corsi (non importa di quale settoria sia il prof.)

CREATE TRIGGER trg_corso_scoperto
BEFORE INSERT ON corsi
FOR EACH ROW BEGIN
	IF NEW.professore IS NULL THEN
	
		SELECT matricola INTO @profe
		FROM professori
		WHERE matricola NOT IN (
			SELECT DISTINCT professore
			FROM corsi
			WHERE professore IS NOT NULL
		)
		LIMIT 1;
		
		SET NEW.professore = @profe ;
		
	END IF ;
END $$