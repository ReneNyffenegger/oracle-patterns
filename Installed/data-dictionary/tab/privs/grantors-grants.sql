connect / as sysdba

create user grantor_one identified by pw;
create user grantee_one identified by pw;
create user tab_owner   identified by pw quota unlimited on users;

grant create session,
      create table
to    tab_owner;

grant create session
to    grantor_one;

grant create session
to    grantee_one;

connect tab_owner/pw

create table table_one (foo number);

grant  select                         on           table_one to grantor_one with grant option;
grant          insert, update, delete on           table_one to grantor_one;


grant  select, insert                 on           table_one to grantee_one;

connect grantor_one/pw

grant   select                        on tab_owner.table_one to grantee_one;


connect / as sysdba
select
   grantor,
   grantable
-- hierarchy /* ?? */
from
   dba_tab_privs
where
   owner      = 'TAB_OWNER'   and
   grantee    = 'GRANTEE_ONE' and
   privilege  = 'SELECT'      and
   table_name = 'TABLE_ONE'
;

connect grantee_one/pw
select * from tab_owner.table_one;

connect tab_owner/pw
revoke  all on table_one from grantee_one;

connect / as sysdba
select
   grantor,
   grantable
-- hierarchy /* ?? */
from
   dba_tab_privs
where
   owner      = 'TAB_OWNER'   and
   grantee    = 'GRANTEE_ONE' and
   privilege  = 'SELECT'      and
   table_name = 'TABLE_ONE'
;
  
connect grantee_one/pw
select * from tab_owner.table_one;

connect / as sysdba
drop user grantor_one cascade;
drop user grantee_one cascade;
drop user tab_owner   cascade;
