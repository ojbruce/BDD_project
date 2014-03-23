/**
  * Vue pour la police
  * Permet de trouver les terroristes
  */
CREATE VIEW fbi_view AS 
	SELECT * 
	FROM  Personne Natural Join Prioritaire 
	Where Prioritaire.statutPrioritaire='terroriste';

/**
  * Hackers are in your home 
  */
CREATE VIEW i_hack_you_view AS 
	SELECT Personne.nom, Personne.prenom 
	FROM (Personne Natural Join Employe) Natural Join Entreprise  
	Where Entreprise.nomEntreprise = 'NSA';
