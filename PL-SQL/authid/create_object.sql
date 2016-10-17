--
--  In what schema is an object created (execute immediate)
--
connect / as sysdba

create user usr_01 identified by usr_01;
create user usr_02 identified by usr_02;

grant create table, create session, create procedure to usr_01;
grant create table, create session                   to usr_02;

connect usr_01/usr_01

create package pkg
  authid current_user
as
  procedure do;
end pkg;
/

create package body pkg as
  procedure do is begin
    execute immediate 'create table tq84_tab (a number)';
  end do;
end pkg;
/

grant execute on pkg to usr_02;

connect usr_02/usr_02

exec usr_01.pkg.do

connect / as sysdba

select owner from dba_tables where table_name = 'TQ84_TAB';
-- Table is created in USR_02' schema.

drop user usr_01 cascade;
drop user usr_02 cascade;
