connect / as sysdba

drop user a_user cascade;
drop user user_to_be_cloned;
drop role a_role;

create user a_user identified by a_password;
create user user_to_be_clonedidentified by "Secret*49" quota 10M on users;
create role a_role;

create table a_user.table_01 (id number);
create table a_user.table_02 (id number);
create table a_user.table_03 (id number);

grant
  create session,
  create table
to
  user_to_be_cloned;


grant select, insert on a_user.table_01 to user_to_be_cloned;
grant all            on a_user.table_02 to a_role;

grant a_role                            to user_to_be_cloned;
