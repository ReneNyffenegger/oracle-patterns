create table tq84_distinct (
       a     number,
       b     number,
       c     number
);

insert into tq84_distinct values (1, 1, 1);
insert into tq84_distinct values (1, 1, 1);
insert into tq84_distinct values (1, 1, 1);

insert into tq84_distinct values (2, 2, 2);
insert into tq84_distinct values (2, 2, 3);

insert into tq84_distinct values (3, 3, 3);
insert into tq84_distinct values (3, 4, 4);

insert into tq84_distinct values (4, 1, 2);
insert into tq84_distinct values (4, 3, 4);
insert into tq84_distinct values (4, 5, 6);

-- Note: the paranthesis around the `a` is
--       misleading. They belong to the `a`,
--       not the the distinct.

select distinct (a),
       b,
       c
  from tq84_distinct
 order by a, b, c;

prompt
prompt

select distinct 
       a,
       b,
       c
  from tq84_distinct
 order by a, b, c;

drop table tq84_distinct purge;
