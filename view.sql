/**
 * Projet BDD
 * Base de donnée de la NSA
 *
 * @author : Olivia Bruce
 * @author : Matthieu Riou
 * @author : Brice Thomas
 */


/**
  * Vue pour la fbi
  * Vue qui se focalise sur personnes etant des terroristes
  */
CREATE VIEW fbi_view AS 
	SELECT * 
	FROM  Personne Natural Join Prioritaire 
	Where Prioritaire.statutPrioritaire='Terroriste';

/**
  * Vue des hackers: "Hackers are inside"
  * Vue qui fournit aux hackersles noms et prenoms des agents de la NSA
  */
CREATE VIEW i_hack_you_view AS 
	SELECT Personne.nom, Personne.prenom 
	FROM (Personne Natural Join Employe) Natural Join Entreprise  
	Where Entreprise.nomEntreprise = 'NSA';
	
	
/** 
 * Vue mail_<fai>_view.
 * Permet aux fai un accès restreint aux personnes présentes dans la base
 * en selectionnant leurs utilisateurs de service mail.
 * 
 **/
--Free
CREATE VIEW mail_free_view AS SELECT adresseMail, mdpMail, proprietaireMail FROM Mail WHERE fournisseurMail = 'Free';

--Orange
CREATE VIEW mail_orange_view AS SELECT adresseMail, mdpMail, proprietaireMail FROM Mail WHERE fournisseurMail = 'Orange';

--laposte
CREATE VIEW mail_laposte_view AS SELECT adresseMail, mdpMail, proprietaireMail FROM Mail WHERE fournisseurMail = 'Laposte';


/** Vue Telephone **/
/** 
 * Vue telephone_<fai>_view.
 * Permet aux fai un accès restreint aux personnes présentes dans la base
 * en selectionnant leurs utilisateurs de service telephonique.
 * 
 **/
--SFR
CREATE VIEW telephone_sfr_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'SFR';

--Free
CREATE VIEW telephone_free_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'Free';

--Orange
CREATE VIEW telephone_orange_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'Orange';

--Bouygues
CREATE VIEW telephone_bouygues_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'Bouygues';

--Numericable
CREATE VIEW telephone_numericable_view AS SELECT numTelephone, codePin, proprietaireTelephone FROM Telephone WHERE fournisseurTelephone = 'Numericable';
