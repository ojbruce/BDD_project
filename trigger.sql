/**
 * Projet BDD
 * Base de donnée de la NSA
 *
 * @author : Olivia Bruce
 * @author : Matthieu Riou
 * @author : Brice Thomas
 */

--Pour permettre l'affichage dans la console
SET SERVEROUTPUT ON;

/**
 * Easter Egg 
 * Trigger qui se déclenche lorsqu'une personne est ajouté dont le prénom est Cookie
 * Un trigger simple.
 */
CREATE OR REPLACE TRIGGER cookie
AFTER INSERT OR UPDATE ON Personne
FOR EACH ROW
BEGIN
	IF :new.nom = 'Cookie' THEN
		DBMS_OUTPUT.put_line('[INFO] Cooooookie !!!');
	END IF;
END;
/

/**
 * Trigger de detection de terroriste.
 * "Envoie" un mail lorsque l'ajout d'un  nouveau terroriste est détecté.
 */
CREATE OR REPLACE TRIGGER terroriste
AFTER INSERT OR UPDATE ON Prioritaire
FOR EACH ROW
BEGIN
	IF :new.statutPrioritaire = 'Terroriste' THEN
		DBMS_OUTPUT.put_line('Sending email...');
	END IF;
END;
/



/** Trigger Mail **/

/**
 * Trigger : mail_<fai>_ajout
 * Triggers qui lorsque l'on fait des ajouts dans une vue ajoute dans la table Mail 
 * Chacun font reference a des fai differents.
 * 
 */
--Free
CREATE TRIGGER mail_free_ajout
INSTEAD OF insert ON mail_free_view
FOR EACH ROW
BEGIN
	INSERT INTO Mail VALUES (:new.adresseMail, :new.mdpMail, :new.proprietaireMail, 'Free');
END;
/

--Orange
CREATE TRIGGER mail_orange_ajout
INSTEAD OF insert ON mail_orange_view
FOR EACH ROW
BEGIN
	INSERT INTO Mail VALUES (:new.adresseMail, :new.mdpMail, :new.proprietaireMail, 'Orange');
END;
/

--laposte
CREATE TRIGGER mail_laposte_ajout
INSTEAD OF insert ON mail_laposte_view
FOR EACH ROW
BEGIN
	INSERT INTO Mail VALUES (:new.adresseMail, :new.mdpMail, :new.proprietaireMail, 'Laposte');
END;
/


/** Trigger Telephone **/
/**
 * Trigger : telephone_<fai>_ajout
 * Triggers qui lorsque l'on fait des ajouts dans une vue de type fai_telephone ajoute dans la table telephone 
 * Chacun font reference a des fai differents.
 * 
 */

--SFR
CREATE TRIGGER telephone_sfr_ajout
INSTEAD OF insert ON telephone_sfr_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'SFR');
END;
/

--FREE
CREATE TRIGGER telephone_free_ajout
INSTEAD OF insert ON telephone_free_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'Free');
END;
/

--Orange
CREATE TRIGGER telephone_orange_ajout
INSTEAD OF insert ON telephone_orange_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'Orange');
END;
/

--Bouygues
CREATE TRIGGER telephone_bouygues_ajout
INSTEAD OF insert ON telephone_bouygues_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'Bouygues');
END;
/

--Numericable
CREATE TRIGGER telephone_numericable_ajout
INSTEAD OF insert ON telephone_numericable_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'Numericable');
END;
/
