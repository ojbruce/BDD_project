/** 
  * Role pour la NSA
  * Role attribue aux membres de la NSA
  * 
  **/
DROP ROLE NSA;
CREATE ROLE NSA;

GRANT all on Personne to NSA;
GRANT all on ENTREPRISE to NSA;
GRANT all on EMPLOYE to NSA;
GRANT all on PRIORITAIRE to NSA;
GRANT all on RELATION to NSA;
GRANT all on MAIL to NSA;
GRANT all on COMPTEBANCAIRE to NSA;
GRANT all on CONVERSATION to NSA;
GRANT all on TELEPHONE to NSA;

GRANT NSA to L3_19;
GRANT NSA to L3_18;


/** 
  * Role pour la police
  * Possibilite de regarder uniquement sur une vue 
  **/
CREATE ROLE FBI;
GRANT select on fbi_view to FBI;



