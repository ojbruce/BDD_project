/**
 * Projet BDD
 * Base de donnée de la NSA
 *
 * @author : Olivia Bruce
 * @author : Matthieu Riou
 * @author : Brice Thomas
 */


/** 
 * Fonction update vente de sfr à numéricable 
 **/

CREATE PROCEDURE update_vente_sfr
IS
BEGIN
	UPDATE Telephone SET fournisseurTelephone = 'Numericable' WHERE fournisseurTelephone = 'SFR';
END;
/


/**
 * Fonction entourage_bis qui trouver les liens entre les gens et en calculer l'eloignement
 * @param id : id de la personne dont on cherche l'entourage à cette étape
 * @param id2: id de la personne dont on cherche l'entourage à l'origine
 * @param n: 	degré d'éloignement restant à explorer
 * @param diff:degré d'éloignement déjà exploré
 */
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

/**
 * Fonction entourage qui initialise les paramètres d'entourage_bis
 * @param id :id de la personne dont on cherche l'entourage
 * @param n:  degré d'éloignement à explorer
 */
CREATE PROCEDURE entourage (id number, n number)
IS
BEGIN
	entourage_bis(id, id, n, 1);
END;
/
