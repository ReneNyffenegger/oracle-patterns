select * from v$pq_tqstat;

-- Execute a parallel query to fill v$pq_stat:
select /*+ parallel */ count(*)
  from all_objects
 where substr(object_name, 5, 1) = 'B';

select count(*) from v$pq_tqstat;

select
  count(*)           cnt,
  server_type,    -- Producer, Consumer, QC or ranger
  dfo_number ,    -- The DFO tree
  tq_id      ,    -- Table Queue
  instance
from
  v$pq_tqstat
group by
  server_type,
  dfo_number,
  tq_id,
  instance
order by
  server_type,
  dfo_number,
  tq_id;

select
  count(*),
  process
from
  v$pq_tqstat
group by
  process
order by
  process;
