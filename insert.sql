/* Personne */
INSERT INTO Personne VALUES (0, 'Marley', 'Bob', 'Homme', '18-APR-1978', '12 rue des marguerites', 'Joli cheveux');
INSERT INTO Personne VALUES (1, 'Little', 'Jamina', 'Femme', '21-JAN-1998', '12 rue des marguerites', 'Grande');
INSERT INTO Personne VALUES (2, 'Martin', 'Martin', 'Homme', '1-JUL-1956', '4 avenue Paul Roublard', 'Jeune et grand');
INSERT INTO Personne VALUES (3, 'Jospin', 'Paul', 'Homme', '9-DEC-1992', '6 rue des paillettes', 'Petite personne');

/* Prioritaire */
INSERT INTO Personne VALUES (4, 'Alexander', 'Keith', 'Homme', '2-DEC-1951', '33 Federal Street New York', 'A des lunettes');
INSERT INTO Entreprise VALUES (0, 'NSA', 'Organisation gouvernementale');
INSERT INTO Employe VALUES (4, 0, 'Directeur');

INSERT INTO Personne VALUES (5, 'Merkel', 'Angela', 'Femme', '17-JUL-1954', '27 rue Meldermann' , '');
INSERT INTO Prioritaire VALUES (5, 'Chancelier Federal Allemand');

INSERT INTO Personne VALUES (6, 'Dupond', 'Mohamed', 'Homme', '23-NOV-1985', '76 rue des ananas', 'Louche');
INSERT INTO Prioritaire VALUES (6, 'Terroriste');

INSERT INTO Entreprise VALUES (1, 'ColoriFleur', '?');
INSERT INTO Employe VALUES (0, 1, 'Chef d equipe');
INSERT INTO Employe VALUES(6, 1, 'Livreur');

/* Relation */
INSERT INTO Relation VALUES (0, 6, 'Amitie', 'Travail');
INSERT INTO Relation VALUES (6, 0, 'Indifference', 'Travail');
INSERT INTO Relation VALUES (0, 3, 'Fils', 'Famille');
INSERT INTO Relation VALUES (3, 0, 'Pere', 'Famille');
INSERT INTO Relation VALUES (6, 2, 'Amitie', 'Internet');
INSERT INTO Relation VALUES (2, 6, 'Amitie', 'Internet');

/* Mail */
INSERT INTO Mail VALUES ('b.marley@laposte.net', '1841978', 0, 'Laposte');
INSERT INTO Mail VALUES ('bomberman@free.fr', 'alquaida', 6, 'Free');

/* Telephone */
INSERT INTO Telephone VALUES ('0658764323', '3945', 5, 'SFR');
/* essaie d'insertion dans la vue */
INSERT INTO telephone_orange_view VALUES ('0634216589', '0000', 2);

/* Compte Bancaire */
INSERT INTO CompteBancaire VALUES ('FR7630046001290029721519546', '50000', '4598', 3);	
INSERT INTO CompteBancaire VALUES ('AL7640046001290029721519546', '16250000', '9999', 5);	

/* Conversation */
INSERT INTO Conversation VALUES ( 0, '23-NOV-1985' , 'Appel secret', 'Hello cheri on se voit à la sortie', 0,1); 
INSERT INTO Conversation VALUES ( 1, '20-APR-2001' , 'SMS', 'Avion en vue des tours', 6,4); 


