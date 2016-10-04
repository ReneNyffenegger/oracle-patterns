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

select
  percent_rank( 0  ) within group (order by num) pct_rnk__0,
  percent_rank( 0.9) within group (order by num) pct_rnk__0_9,
  percent_rank( 1.0) within group (order by num) pct_rnk__1_0,
  percent_rank( 1.1) within group (order by num) pct_rnk__1_1,
  percent_rank( 2  ) within group (order by num) pct_rnk__2,
  percent_rank( 3  ) within group (order by num) pct_rnk__3,
  percent_rank( 4  ) within group (order by num) pct_rnk__4,
  percent_rank(10  ) within group (order by num) pct_rnk_10,
  percent_rank(11  ) within group (order by num) pct_rnk_11
from
  tq84_percent;
--
-- PCT_RNK__0 PCT_RNK__0_9 PCT_RNK__1_0 PCT_RNK__1_1 PCT_RNK__2 PCT_RNK__3 PCT_RNK__4 PCT_RNK_10 PCT_RNK_11
-- ---------- ------------ ------------ ------------ ---------- ---------- ---------- ---------- ----------
--          0            0            0   .166666667 .166666667 .333333333 .333333333 .833333333          1


drop table tq84_percent;
