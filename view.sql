/**
  * Vue pour la fbi
  * Permet de trouver les terroristes
  */
CREATE VIEW fbi_view AS 
	SELECT * 
	FROM  Personne Natural Join Prioritaire 
	Where Prioritaire.statutPrioritaire='Terroriste';

/**
  * Hackers are in your home 
  */
CREATE VIEW i_hack_you_view AS 
	SELECT Personne.nom, Personne.prenom 
	FROM (Personne Natural Join Employe) Natural Join Entreprise  
	Where Entreprise.nomEntreprise = 'NSA';
	
	
/** Vue Mail **/

CREATE VIEW mail_free_view AS SELECT adresseMail, mdpMail, proprietaireMail FROM Mail WHERE fournisseurMail = 'Free';

CREATE VIEW mail_orange_view AS SELECT adresseMail, mdpMail, proprietaireMail FROM Mail WHERE fournisseurMail = 'Orange';

CREATE VIEW mail_laposte_view AS SELECT adresseMail, mdpMail, proprietaireMail FROM Mail WHERE fournisseurMail = 'Laposte';


/** Vue Telephone **/

CREATE VIEW telephone_sfr_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'SFR';

CREATE VIEW telephone_free_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'Free';

CREATE VIEW telephone_orange_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'Orange';

CREATE VIEW telephone_bouygues_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'Bouygues';

CREATE VIEW telephone_numericable_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'Numericable';
