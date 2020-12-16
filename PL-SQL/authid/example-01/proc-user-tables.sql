connect proc_user/pw;

create table t (txt varchar2(40));
insert into  t values (q'!This is proc_user's table!');

create table u (txt varchar2(40));
insert into  u values (q'!This is proc_user's table!');
