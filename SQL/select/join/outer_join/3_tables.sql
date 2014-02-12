create table tq84_a (
   a   number
);

create table tq84_b (
   b   number
);

create table tq84_c (
   c   number
);

insert into tq84_a values (1);
insert into tq84_a values (2);
insert into tq84_a values (3);

insert into tq84_b values (1);
insert into tq84_b values (2);

insert into tq84_c values (1);
insert into tq84_c values (3);


prompt
prompt ___ Select three records ___

select
  a.a,
  b.b,
  c.c
from
  tq84_a  a             left join
  tq84_b  b  on  a = b  left join
  tq84_c  c  on  b = c;

prompt
prompt ___ Select one record ____

select
  a.a,
  b.b,
  c.c
from
  tq84_a  a             left join
  tq84_b  b  on  a = b       join
  tq84_c  c  on  b = c;


drop table tq84_a purge;
drop table tq84_b purge;
drop table tq84_c purge;
