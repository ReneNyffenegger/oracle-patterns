create table tq84_percent (
  num number
);

insert into tq84_percent values ( 1);
insert into tq84_percent values ( 4);
insert into tq84_percent values ( 2);
insert into tq84_percent values ( 9);
insert into tq84_percent values ( 9);
insert into tq84_percent values (10);


select
    num,
    percent_rank() over (order by num)                               pct_rnk,
   (        rank() over (order by num) - 1) / (count(*) over ()  -1) pct_rnk_calc
from
  tq84_percent
order by
    num;
--        NUM    PCT_RNK PCT_RNK_CALC
-- ---------- ---------- ------------
--          1          0            0
--          2         .2           .2
--          4         .4           .4
--          9         .6           .6
--          9         .6           .6
--         10          1            1

drop table tq84_percent;
