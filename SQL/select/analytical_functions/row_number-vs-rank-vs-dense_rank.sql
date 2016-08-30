create table tq84_abc (
  val    number,
  text   varchar2(20)
);

insert into tq84_abc values (5, 'foo five');
insert into tq84_abc values (4, 'bar four');
insert into tq84_abc values (6, 'foo six (a)');
insert into tq84_abc values (7, 'baz seven');
insert into tq84_abc values (6, 'foo six (b)');
insert into tq84_abc values (6, 'foo six (c)');
insert into tq84_abc values (7, 'foo seven');

select
  val,
  text,
  row_number() over (order by val) rn,
  rank      () over (order by val) rk,
  dense_rank() over (order by val) dk
from
  tq84_abc
order by
  val;

drop table tq84_abc purge;
