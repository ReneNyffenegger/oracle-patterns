connect rene/rene

create user tq84_a identified by tq84_a;
create user tq84_b identified by tq84_b;
create user tq84_c identified by tq84_c;

grant create table, create view, create session to tq84_a;
grant create table, create view, create session to tq84_b;
grant create table, create view, create session to tq84_c;

---------------- A:

connect tq84_a/tq84_a; 
create table t (a number, b varchar2(10));


-- If the following grant is given without
-- the «grant option», an ORA-01720 will
-- be raised on tq84_b's attempt to grant
-- select on v to tq84_c (see comment there)
grant select on t to tq84_b with grant option;

grant select on t to tq84_c;

-------------------------------------------

---------------- B:

connect tq84_b/tq84_b; 
create table t (a number, b varchar2(10));


create view v as 
  select * from tq84_a.t union all
  select * from tq84_b.t;

alter session set nls_language = english;

-- 
-- ORA-01720: grant option does not exist for 'TQ84_A.T'
-- if tq84_b does not have the «grant option» for 
-- tq84a.t:
grant select on v to tq84_c;

-------------------------------------------

connect tq84_c/tq84_c

select * from tq84_b.v;


connect rene/rene

drop user tq84_c cascade;
drop user tq84_b cascade;
drop user tq84_a cascade;
