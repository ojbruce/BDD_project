CREATE OR REPLACE TRIGGER colocation
AFTER insert or update ON Personne
FOR EACH ROW
DECLARE
	Cursor C1 is SELECT idPersonne, adressePrincipale FROM Personne WHERE adressePrincipale = :new.adressePrincipale;
	i C1%rowtype;
	cpt int;
BEGIN
	FOR i in C1 LOOP

			SELECT count(*) INTO cpt FROM Relation WHERE (emetteur=i.idPersonne and recepteur=:new.idPersonne);
		
			IF cpt = 0 THEN
				INSERT INTO Relation VALUES (i.idPersonne, :new.idPersonne, 'Connaissance', 'Logement');
			END IF;
		
			SELECT count(*) INTO cpt FROM Relation WHERE (emetteur=:new.idPersonne and recepteur=i.idPersonne);
		
			IF cpt = 0 THEN
				INSERT INTO Relation VALUES (:new.idPersonne, i.idPersonne, 'Connaissance', 'Logement');
			END IF;

		
	END LOOP;
	
END;
/
