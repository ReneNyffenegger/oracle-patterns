create table tq84_median (
  val number
);

insert into tq84_median values (     1);
insert into tq84_median values (     2);
insert into tq84_median values (     3);
insert into tq84_median values (     4);

insert into tq84_median values (100000);
insert into tq84_median values (400000);
insert into tq84_median values (999999);

select
  avg   (val) avg_,
  median(val) median_
from
  tq84_median;
-- 
--       AVG_    MEDIAN_
-- ---------- ----------
--     214287          4

drop table tq84_median;
