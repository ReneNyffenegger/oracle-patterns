create table tq84_root (a number);

create view tq84_dep_1 as select a*2  a2 from tq84_root;

create view tq84_dep_2 as select a2*2 a4 from tq84_dep_1;

select name from user_dependencies where referenced_name = 'TQ84_ROOT';
-- TQ84_DEP_1

select name from user_dependencies where referenced_name = 'TQ84_DEP_1';
-- TQ84_DEP_2

drop view  tq84_dep_2;
drop view  tq84_dep_1;
drop table tq84_root purge;
