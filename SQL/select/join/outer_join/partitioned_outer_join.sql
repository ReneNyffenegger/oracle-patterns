create table tq84_partitioned_outer_join (
   col_1   varchar2(10),
   col_2   varchar2(10),
   num     number
);

insert into tq84_partitioned_outer_join values ('one'  , 'foo',   1);
insert into tq84_partitioned_outer_join values ('one'  , 'foo',   1);
--
insert into tq84_partitioned_outer_join values ('one'  , 'bar',   2);
insert into tq84_partitioned_outer_join values ('one'  , 'bar',   0);

insert into tq84_partitioned_outer_join values ('two'  , 'bar',   3);
insert into tq84_partitioned_outer_join values ('two'  , 'bar',   1);
--
insert into tq84_partitioned_outer_join values ('two'  , 'baz',   2);
insert into tq84_partitioned_outer_join values ('two'  , 'baz',   2);

insert into tq84_partitioned_outer_join values ('three', 'foo',   5);
insert into tq84_partitioned_outer_join values ('three', 'foo',   7);
--
insert into tq84_partitioned_outer_join values ('three', 'baz',   6);
insert into tq84_partitioned_outer_join values ('three', 'baz',   6);
--
insert into tq84_partitioned_outer_join values ('four' , 'xxx',   9);

select
  col_1,
  col_2,
  sum(num)
from
  tq84_partitioned_outer_join
group by
  col_1, col_2
order by
  col_1,
  col_2;


prompt
prompt ------
prompt


with fbb as (
  select 'foo' c from dual union all
  select 'bar' c from dual union all
  select 'baz' c from dual
)
select
  tab.col_1,
  fbb.c,
  sum(tab.num) s
from
  fbb                             left outer join
  tq84_partitioned_outer_join tab
                                  partition by (tab.col_1)
                                  on fbb.c = tab.col_2
group by
  tab.col_1,
  fbb.c
order by
  tab.col_1,
  fbb.c;


drop table tq84_partitioned_outer_join purge;
