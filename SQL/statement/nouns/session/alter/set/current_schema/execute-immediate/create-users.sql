create user pkg_owner identified by pw default tablespace data quota unlimited on data;
create user pkg_user  identified by pw default tablespace data quota unlimited on data;

grant create session, create procedure to pkg_owner;
grant create session                   to pkg_user;
