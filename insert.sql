/* Personne */
INSERT INTO Personne VALUES (0, 'Marley', 'Bob', 'Homme', '18-APR-1978', '12 rue des marguerites', 'Joli cheveux');
INSERT INTO Personne VALUES (1, 'Little', 'Jamina', 'Femme', '21-JAN-1998', '12 rue des marguerites', 'Grande');
INSERT INTO Personne VALUES (2, 'Martin', 'Martin', 'Homme', '1-JUL-1956', '4 avenue Paul Roublard', 'Jeune et grand');
INSERT INTO Personne VALUES (3, 'Jospin', 'Paul', 'Homme', '9-DEC-1992', '6 rue des paillettes', 'Petite personne');

/* Prioritaire */
INSERT INTO Personne VALUES (4, 'Alexander', 'Keith', 'Homme', '2-DEC-1951', '33 Federal Street New York', 'A des lunettes');
INSERT INTO Entreprise VALUES (0, 'NSA', '?');
INSERT INTO Employe VALUES (4, 0, 'Directeur');

INSERT INTO Personne VALUES (5, 'Merkel', 'Angela', 'Femme', '17-JUI-1954', '156 ?' , '');
INSERT INTO Prioritaire VALUES (5, 'Chancelier Federal Allemand');

INSERT INTO Personne VALUES (6, 'Dupond', 'Mohamed', 'Homme', '23-NOV-1985', '76 rue des ananas', 'Louche');
INSERT INTO Prioritaire VALUES (6, 'Terroriste');

INSERT INTO Entreprise VALUES (1, 'ColoriFleur', '?');
INSERT INTO Employe VALUES (0, 1, 'Chef d\'équipe');
INSERT INTO Employe VALUES(6, 1, 'Livreur');

INSERT INTO Relation VALUES (0, 6, 'Amitie', 'Travail');
INSERT INTO Relation VALUES (6, 0, 'Indifference', 'Travail');
INSERT INTO Relation VALUES (0, 3, 'Fille', 'Famille');
INSERT INTO Relation VALUES (3, 0, 'Pere', 'Famille');
INSERT INTO Relation VALUES (6, 2, 'Amitie', 'Internet');
INSERT INTO Relation VALUES (2, 6, 'Amitie', 'Internet');

INSERT INTO Mail VALUES ('b.marley@laposte.net', '1841978', 0, 'Laposte');
INSERT INTO Mail VALUES ('bomberman@free.fr', 'alquaida', 6, 'Free');

INSERT INTO Telephone VALUES ('0658764323', '3945', 5, 'SFR');
INSERT INTO Telephone VALUES ('0634216589', '0000', 2, 'Orange');



