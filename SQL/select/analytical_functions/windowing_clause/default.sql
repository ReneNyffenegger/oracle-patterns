--
-- The defalt for the windowing clause is:
--   RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.
--

create table tq84_table (
  i number,
  s number
);

insert into tq84_table values (1,  1);
insert into tq84_table values (2,  1);
insert into tq84_table values (3,  2);
insert into tq84_table values (4,  3);
insert into tq84_table values (5,  5);
insert into tq84_table values (6,  8);
insert into tq84_table values (7, 13);
insert into tq84_table values (8, 20);

select
  s,
  sum  (s) over (order by i                                                  ) sum_1,
  sum  (s) over (order by i range between unbounded preceding and current row) sum_2,
  count(*) over (order by i                                                  ) count_1,
  count(*) over (order by i range between unbounded preceding and current row) count_2
from
  tq84_table;

drop table tq84_table purge;
