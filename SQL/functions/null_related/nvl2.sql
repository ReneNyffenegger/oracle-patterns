create table tq84_nvl2 (
  a number
);

insert into tq84_nvl2 values (null);
insert into tq84_nvl2 values (   0);
insert into tq84_nvl2 values (  42);

select
  a,
  nvl2(a, 'not null', 'null')
from
  tq84_nvl2;

drop table tq84_nvl2 purge;
