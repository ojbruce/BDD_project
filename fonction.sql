/** Fonction update vente de sfr à numéricable **/

CREATE PROCEDURE update_vente_sfr
IS
BEGIN
	UPDATE Telephone SET fournisseurTelephone = 'Numericable' WHERE fournisseurTelephone = 'SFR';
END;
/

/**CREATE TRIGGER limite_conv
BEFORE INSERT ON Conversation
FOR EACH ROW
BEGIN
	SELECT count(*) as cpt FROM Conversation Join Prioritaire ON allocuteur1 = idPersonne;
	IF cpt > 15 THEN
		DELETE last_conv
	END IF;
END;
/

CREATE PROCEDURE entourage (n number, diff number)
IS
	Cursor C1 = SELECT * FROM Personne;
	i C1%rowtype;
BEGIN
	FOR i in C1 LOOP
		affiche i.nom, diif
		entourage(n-1, diff+1)
	END LOOP;
END;
/**/
