create user u1 identified by u1
   default tablespace data
   quota unlimited on data;

grant
   create session,
   create table to u1;

create user u2 identified by u2
   default tablespace data
   quota unlimited on data;

grant
   create session,
   create table to u2;
