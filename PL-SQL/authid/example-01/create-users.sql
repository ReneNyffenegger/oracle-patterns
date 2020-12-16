connect rene/rene

create user proc_owner identified by pw default tablespace data quota unlimited on data;
create user proc_user  identified by pw default tablespace data quota unlimited on data;

grant create session, create procedure, create table, create view to proc_owner;
grant create session, create procedure, create table, create view to proc_user ;
