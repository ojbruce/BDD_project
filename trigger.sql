SET SERVEROUTPUT ON;

/* Easter egg */
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



/** Trigger Mail **/

CREATE TRIGGER mail_free_ajout
INSTEAD OF insert ON mail_free_view
FOR EACH ROW
BEGIN
	INSERT INTO Mail VALUES (:new.adresseMail, :new.mdpMail, :new.proprietaireMail, 'Free');
END;
/

CREATE TRIGGER mail_orange_ajout
INSTEAD OF insert ON mail_orange_view
FOR EACH ROW
BEGIN
	INSERT INTO Mail VALUES (:new.adresseMail, :new.mdpMail, :new.proprietaireMail, 'Orange');
END;
/

CREATE TRIGGER mail_laposte_ajout
INSTEAD OF insert ON mail_laposte_view
FOR EACH ROW
BEGIN
	INSERT INTO Mail VALUES (:new.adresseMail, :new.mdpMail, :new.proprietaireMail, 'Laposte');
END;
/


/** Trigger Telephone **/

CREATE TRIGGER telephone_sfr_ajout
INSTEAD OF insert ON telephone_sfr_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'SFR');
END;
/

CREATE TRIGGER telephone_free_ajout
INSTEAD OF insert ON telephone_free_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'Free');
END;
/

CREATE TRIGGER telephone_orange_ajout
INSTEAD OF insert ON telephone_orange_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'Orange');
END;
/

CREATE TRIGGER telephone_bouygues_ajout
INSTEAD OF insert ON telephone_bouygues_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'Bouygues');
END;
/

CREATE TRIGGER telephone_numericable_ajout
INSTEAD OF insert ON telephone_numericable_view
FOR EACH ROW
BEGIN
	INSERT INTO Telephone VALUES (:new.numTelephone, :new.codePin, :new.proprietaireTelephone, 'Numericable');
END;
/
