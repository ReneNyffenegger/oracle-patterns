create table tq84_a (
  a  varchar2(10),
  b  number
);

insert into tq84_a values ('a', 1);
insert into tq84_a values ('b', 2);
insert into tq84_a values ('a', 4);
insert into tq84_a values ('b', 3);

select
  max(a) keep (dense_rank first order by b desc)  a,
  max(b) keep (dense_rank first order by b desc)  b
from
  tq84_a
;

drop table tq84_a purge;
