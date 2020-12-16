connect proc_owner/pw;

create table t (txt varchar2(40));
insert into  t values (q'!This is proc_owner's table!');

create table u (txt varchar2(40));
insert into  u values (q'!This is proc_owner's table!');

grant select on t to proc_user;
-- no grant on u
