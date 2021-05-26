select
   sum(avg(val_2)) val_2_sum_of_avg,
   avg(sum(val_2)) val_2_avg_of_sum
from
   tq84_nested_aggr_func_test
group by
   val_1
;
--
-- VAL_2_SUM_OF_AVG VAL_2_AVG_OF_SUM
-- ---------------- ----------------
--               19               10
