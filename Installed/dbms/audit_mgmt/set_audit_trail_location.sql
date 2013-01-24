prompt
prompt   Initially, AUD$ and FGA_LOG$ both are in the 
prompt   system tablespace:
prompt

select
  table_name,
  tablespace_name
from
  dba_tables
where
  table_name in ('AUD$', 'FGA_LOG$');


prompt
prompt   Create dedicated tablespace for fga_log$
prompt


create tablespace 
  FGA_LOG_TS
  datafile 'C:\ORACLE\DBMANUAL_FILES\FGA_LOG.DBF'
  size 1M
  extent management local autoallocate
  segment space management auto
;


prompt
prompt   Move audit trail FGA_LOG$ to new tablespace
prompt

connect sys as sysdba

begin

  dbms_audit_mgmt.set_audit_trail_location(
    audit_trail_type            =>  dbms_audit_mgmt.audit_trail_fga_std,
    audit_trail_location_value  => 'FGA_LOG_TS'
  );

end;
/
