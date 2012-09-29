create table tq84_group_by_vs_over (
  a varchar2(3),
  b number
);


insert into tq84_group_by_vs_over values ('foo', 42);
insert into tq84_group_by_vs_over values ('foo', 10);
insert into tq84_group_by_vs_over values ('foo', 13);

insert into tq84_group_by_vs_over values ('bar',  7);
insert into tq84_group_by_vs_over values ('bar', 39);
insert into tq84_group_by_vs_over values ('bar', 88);

insert into tq84_group_by_vs_over values ('baz', 21);

----------------------------------------------------

select
  max(b) keep (dense_rank first order by b desc) over (partition by a) max_b_for_a,
  --                                             ^^^^^^^^^^^^^^^^^^^^^
  --                                             Missing in 2nd query
  a
from tq84_group_by_vs_over
;

----------------------------------------------------

select
  max(b) keep (dense_rank first order by b desc)  max_b_for_a,
  a
from tq84_group_by_vs_over
  group by a -- <<< Missing in 1st query
;

----------------------------------------------------

drop table tq84_group_by_vs_over purge;
