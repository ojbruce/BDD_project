EXEC dbms_output.enable(1000000); /* <-- marche pas top top */

/* Pretty pretty useless */
CREATE OR REPLACE TRIGGER cookie
AFTER INSERT OR UPDATE ON Personne
FOR EACH ROW
BEGIN
	IF :new.nom = 'Cookie' THEN
		DBMS_OUTPUT.put_line('[INFO] Cooooookie !!!');
	END IF;
END;
/

/* Envoie un mail lorsqu'un nouveau terroriste est détecté */
CREATE OR REPLACE TRIGGER terroriste
AFTER INSERT OR UPDATE ON Prioritaire
FOR EACH ROW
BEGIN
	IF :new.statutPrioritaire = 'Terroriste' THEN
		DBMS_OUTPUT.put_line('Sending email...');
	END IF;
END;
/

