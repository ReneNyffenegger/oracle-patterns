create user u1 identified by u1
quota unlimited on users;

grant create session, 
      create table to u1;

create user u2 identified by u2
quota unlimited on users;

grant create session, 
      create table to u2;
