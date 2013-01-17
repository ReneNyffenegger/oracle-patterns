create table tq84_distinct (
       a     number
);

insert into tq84_distinct values (1);
insert into tq84_distinct values (1);

insert into tq84_distinct values (2);

insert into tq84_distinct values (3);

insert into tq84_distinct values (4);
insert into tq84_distinct values (4);

select distinct a from tq84_distinct;

drop table tq84_distinct purge;
