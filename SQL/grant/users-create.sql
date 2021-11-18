connect / as sysdba

create user usr_1
       identified by pw_1
       default tablespace data
       quota unlimited on data;

create user usr_2
       identified by pw_2;

grant  connect,
       create table
    to usr_1;

grant  connect
    to usr_2;
