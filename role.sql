/** 
  * Role pour la NSA
  * Role attribue aux membres de la NSA
  * 
  **/
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
--GRANT NSA to L3_18;


/** 
  * Role pour la police
  * Possibilite de regarder uniquement sur une vue 
  **/
CREATE ROLE FBI;
GRANT select on fbi_view to FBI;


/**
 * Role pour les fournisseurs d'accès internet nos partenaires
 * Acces complet à la vue correspondante.
 * Free acces a mail_free_view et telephone_free_view 
 * Orange acces a mail_orange_view et telephone_orange_view
 * Laposte acces a mail
 * SFR acces a telephone
 * Bouygues acces a telephone
 * Numericable telephone
 */

CREATE ROLE FREE;
GRANT all on mail_free_view to FREE;
GRANT all on telephone_free_view to FREE;

CREATE ROLE ORANGE;
GRANT all on mail_orange_view to ORANGE;
GRANT all on telephone_orange_view to ORANGE;

CREATE ROLE LAPOSTE;
GRANT all on mail_laposte_view to LAPOSTE;

CREATE ROLE SFR;
GRANT all on telephone_sfr_view to SFR;

CREATE ROLE BOUYGUES;
GRANT all on telephone_bouygues_view to BOUYGUES;

CREATE ROLE NUMERICABLE;
GRANT all on telephone_numericable_view to NUMERICABLE;


