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
