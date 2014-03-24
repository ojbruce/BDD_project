/**
 * Projet BDD
 * Base de donnée de la NSA
 *
 * @author : Olivia Bruce
 * @author : Matthieu Riou
 * @author : Brice Thomas
 */

set echo on
spool BRUCE_RIOU_THOMAS.lst

@delete.sql
@versionOracle.sql
@view.sql
@trigger.sql
@fonction.sql
@role.sql
@insert.sql

spool off
