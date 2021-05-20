select
   starts,
   lpad(' ', plan_depth*2) || plan_operation || ' ' || plan_options as op,
   plan_object_owner,
   plan_object_name,
   output_rows,
   plan_cost,
   plan_cardinality,
   plan_bytes,
   plan_time
from
   v$sql_plan_monitor
where
   key = 356482285606
order by
   plan_line_id
;
