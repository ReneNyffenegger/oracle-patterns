connect / as sysdba
@drop_schema_if_exists tq84_user

create user tq84_user
 identified by p
 quota unlimited on users;

grant create procedure,
      create table,
      create session,
      create view
   to tq84_user;

connect tq84_user/p

@c:\temp\schema.sql
