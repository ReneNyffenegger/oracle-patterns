
@connect_with_admin_right

set head off
set pages 0
set long 5000

exec dbms_metadata.set_transform_param(dbms_metadata.session_transform,'SQLTERMINATOR',TRUE);


spool just_a_user_clone.sql

  select dbms_metadata.get_ddl        ('USER'            , 'JUST_A_SCHEMA') from dual;
--select dbms_metadata.get_granted_ddl('ROLE_GRANT'      , 'JUST_A_SCHEMA') from dual;
  select dbms_metadata.get_granted_ddl('SYSTEM_GRANT'    , 'JUST_A_SCHEMA') from dual;
--select dbms_metadata.get_granted_ddl('OBJECT_GRANT'    , 'JUST_A_SCHEMA') from dual;
  select dbms_metadata.get_granted_ddl('TABLESPACE_QUOTA', 'JUST_A_SCHEMA') from dual;

spool off
