select
   val_1      val_1    ,
   avg(val_2) val_2_avg,
   sum(val_2) val_2_sum
from
   tq84_nested_aggr_func_test
group by
   val_1;
--
-- VAL_1  VAL_2_AVG  VAL_2_SUM
-- ----- ---------- ----------
-- GHI           10         10
-- DEF            7         14
-- ABC            2          6
