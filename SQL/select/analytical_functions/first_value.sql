create table tq84_first_value (
  a number,
  b varchar2(10)
);

insert into tq84_first_value values (1, 'B');
insert into tq84_first_value values (2, 'C');
insert into tq84_first_value values (3, 'A');
insert into tq84_first_value values (4, 'E');
insert into tq84_first_value values (5, 'D');

select
  a,
  b,
  first_value(a) over (order by b) first_a, -- 3 (A is first)
  first_value(b) over (order by a) first_b  -- B (1 is first)
from
  tq84_first_value;


drop table tq84_first_value purge;
