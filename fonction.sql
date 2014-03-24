/** Fonction update vente de sfr à numéricable **/

CREATE PROCEDURE update_vente_sfr
IS
BEGIN
	UPDATE Telephone SET fournisseurTelephone = 'Numericable' WHERE fournisseurTelephone = 'SFR';
END;
/

CREATE PROCEDURE entourage_bis (id number, id2 number, n number, diff number)
IS
	Cursor C1 IS SELECT * FROM Personne JOIN Relation ON emetteur = idPersonne WHERE emetteur != id2 and recepteur = id;
	i C1%rowtype;
BEGIN
	IF(n > 0) THEN
		FOR i in C1 LOOP
			DBMS_OUTPUT.put_line(i.nom || ' ' || i.prenom || ' : ' || diff || ' degre d eloignement');
			entourage_bis(i.idPersonne, id2, n-1, diff+1);
		END LOOP;
	END IF;
END;
/

CREATE PROCEDURE entourage (id number, n number)
IS
BEGIN
	entourage_bis(id, id, n, 1);
END;
/
