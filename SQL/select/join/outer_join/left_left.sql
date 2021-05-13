create table tq84_a (
  a1 number,
  a2 varchar2(10)
);

insert into tq84_a values (1, 'foo');
insert into tq84_a values (1, 'bar');
insert into tq84_a values (1, 'baz');
insert into tq84_a values (2, 'abc');
insert into tq84_a values (2, 'def');
insert into tq84_a values (3, 'XXX');

create table tq84_b (
  b1 number          primary key,
  b2 varchar2(10)
);

insert into tq84_b values (1, 'some text');
insert into tq84_b values (3, 'more text');

create table tq84_c (
  c1 number          primary key,
  c2 varchar2(10)
);

insert into tq84_c values (3, '....');

select
  a.a1,
  a.a2,
  b.b2,
  c.c2
from
  tq84_a a                left join
  tq84_b b on a.a1 = b.b1 left join
  tq84_c c on b.b1 = c.c1
order by
  a.a1;
--         A1 A2         B2         C2
-- ---------- ---------- ---------- ----------
--          1 foo        some text
--          1 bar        some text
--          1 baz        some text
--          2 abc
--          2 def
--          3 XXX        more text  ....

drop table tq84_c purge;
drop table tq84_b purge;
drop table tq84_a purge;
