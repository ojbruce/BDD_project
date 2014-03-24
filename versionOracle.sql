/**
 * La table personne.
 * Permet d'enregistrer des personnes.
 */
CREATE TABLE Personne (
	idPersonne NUMBER PRIMARY KEY,
	nom VARCHAR2(255),
	prenom VARCHAR2(255),
	sexe VARCHAR2(20),
	dateNaissance DATE,
	adressePrincipale VARCHAR2(255),
	descriptionPhysique VARCHAR2(255),
	CONSTRAINT sexe CHECK (sexe IN ('Homme', 'Femme'))
);

/**
 * La table entrerise.
 * Permet d'enregistrer les entreprises.
 */
CREATE TABLE Entreprise (
	idEntreprise NUMBER PRIMARY KEY,
	nomEntreprise VARCHAR2(255),
	statutEntreprise VARCHAR2(255)
);

/**
 * La table employe.
 * Permet d'enregistrer une personne employee dans une entreprises.
 * Reference à la table entreprise et personne.
 */
CREATE TABLE Employe (
	idPersonne NUMBER REFERENCES Personne,
	idEntreprise NUMBER REFERENCES Entreprise,
	statutEmploye VARCHAR2(255),
	PRIMARY KEY (idPersonne, idEntreprise)
);

/**
 * La table prioritaire.
 * Permet d'enregistrer les personnes dont le statut de surveillance est prioritaire.
 * Reference à la table personne.
 */
CREATE TABLE Prioritaire (
	idPersonne NUMBER REFERENCES Personne,
	statutPrioritaire VARCHAR2(255),
	PRIMARY KEY(idPersonne, statutPrioritaire)
);

/**
 * La table prioritaire.
 * Permet d'enregistrer les relations entre deux personnes.
 * Reference à la table personne.
 */
CREATE TABLE Relation (
	emetteur NUMBER,
	recepteur NUMBER,
	typeRelation VARCHAR2(255),
	contexteRelation VARCHAR2(255),
	PRIMARY KEY (emetteur, recepteur),
	--CONSTRAINT typeRelation CHECK (typeRelation IN ('Connaissance', 'Amitie', 'Mariage', 'Divorce', 'Adultere', 'Ennemi')),
	--CONSTRAINT contexteRelation CHECK (contexteRelation IN ('Travail', 'Famille', 'Etude', 'Internet', 'Logement')),
	FOREIGN KEY (emetteur) REFERENCES Personne(idPersonne),
	FOREIGN KEY (recepteur) REFERENCES Personne(idPersonne)
);

/**
 * La table des mails.
 * Permet d'enregistrer les adresses mails de chaque personne.
 * Reference à la table personne.
 */
CREATE TABLE Mail (
	adresseMail VARCHAR2(255) PRIMARY KEY,
	mdpMail VARCHAR2(255),
	proprietaireMail NUMBER,
	fournisseurMail VARCHAR2(255),
	CONSTRAINT fournisseurMail CHECK (fournisseurMail IN ('Free', 'Orange', 'Laposte')),
	FOREIGN KEY (proprietaireMail) REFERENCES Personne(idPersonne)
);


/**
 * La table Telephone.
 * Permet d'enregistrer les numeros de telephone de chaque personne.
 * Reference à la table personne.
 */
CREATE TABLE Telephone (
	numTelephone VARCHAR2(255) PRIMARY KEY,
	codePin NUMBER,
	proprietaireTelephone NUMBER,
	fournisseurTelephone VARCHAR2(255),
	CONSTRAINT fournisseurTelephone CHECK (fournisseurTelephone IN ('SFR', 'Free', 'Orange', 'Bouygues', 'Numericable')),
	FOREIGN KEY (proprietaireTelephone) REFERENCES Personne(idPersonne)
);


/**
 * La table comptebancaire.
 * Permet d'enregistrer les comptes banquaires de chaque personne.
 * Reference à la table personne.
 */
CREATE TABLE CompteBancaire (
	iban VARCHAR2(255) PRIMARY KEY,
	solde NUMBER,
	codeBancaire NUMBER,
	proprietaireCompteBancaire NUMBER,
	FOREIGN KEY (proprietaireCompteBancaire) REFERENCES Personne(idPersonne)
);

/**
 * La table conversation.
 * Permet d'enregistrer les conversations entre deux personnes.
 * Reference à la table personne.
 */
CREATE TABLE Conversation (
	idConv NUMBER PRIMARY KEY,
	dateHeureConv DATE,
	typeConv VARCHAR2(255),
	contenuConv VARCHAR2(1500),
	allocuteur1 NUMBER,
	allocuteur2 NUMBER,
	FOREIGN KEY (allocuteur1) REFERENCES Personne(idPersonne),
	FOREIGN KEY (allocuteur2) REFERENCES Personne(idPersonne)
);
