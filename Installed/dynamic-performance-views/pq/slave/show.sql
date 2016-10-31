select
  slave_name,
  status,     -- BUSY, IDLE
  sessions,
  idle_time_cur,
  busy_time_cur,
  cpu_secs_cur,
  msgs_sent_cur,
  msgs_rcvd_cur,
  idle_time_total,
  busy_time_total,
  cpu_secs_total,
  msgs_sent_total,
  msgs_rcvd_total
from
  v$pq_slave;
