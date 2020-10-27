select
   executions,
   cpu_time,
   elapsed_time,
   rows_processed,
   buffer_gets,
   fetches,
   sorts,
   sql_text
from
   v$sql
where
   sql_text like 'select%tq84%'
-- sql_id = '8y1axh4277fm4'
;
