connect / as sysdba

set heading off
set pages   0
set long    1000000
set termout off

exec dbms_metadata.set_transform_param(dbms_metadata.session_transform, 'SQLTERMINATOR', true                              );
--exec dbms_metadata.set_remap_param    (dbms_metadata.session_transform, 'REMAP_SCHEMA', 'USER_TO_BE_CLONED', 'CLONED_USER');
--exec dbms_metadata.set_remap_param    (dbms_metadata.session_transform, 'REMAP_NAME'  , 'USER_TO_BE_CLONED', 'CLONED_USER');

spool create_cloned_user.sql

select replace(dbms_metadata.get_ddl          ('USER'            , 'USER_TO_BE_CLONED'), '"USER_TO_BE_CLONED"','CLONED_USER') from dual;
select replace(dbms_metadata.get_granted_ddl  ('SYSTEM_GRANT'    , 'USER_TO_BE_CLONED'), '"USER_TO_BE_CLONED"','CLONED_USER') from dual;
select replace(dbms_metadata.get_granted_ddl  ('OBJECT_GRANT'    , 'USER_TO_BE_CLONED'), '"USER_TO_BE_CLONED"','CLONED_USER') from dual;
select replace(dbms_metadata.get_granted_ddl  ('ROLE_GRANT'      , 'USER_TO_BE_CLONED'), '"USER_TO_BE_CLONED"','CLONED_USER') from dual;
select replace(dbms_metadata.get_granted_ddl  ('TABLESPACE_QUOTA', 'USER_TO_BE_CLONED'), '"USER_TO_BE_CLONED"','CLONED_USER') from dual;

spool off
set termout on
