select
  sid,
  event,
  total_waits,
  round(time_waited_micro/1000/1000, 2) time_waited_seconds,
  round(time_waited_micro/total_waits/1000, 2) avg_wait_time_millisecond,
  total_timeouts
from
  v$session_event
--where sid = 2323
order by
  time_waited_micro desc;
