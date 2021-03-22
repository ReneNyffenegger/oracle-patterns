select
   ses.sid,
   evt.event,
   evt.total_waits,
   round(evt.time_waited  / 100, 1)  time_waited_s,
   evt.time_waited_micro,
   evt.total_timeouts,
   round(evt.average_wait / 100, 1)  avg_wait_s,
   evt.max_wait,
   evt.wait_class,
   evt.wait_class#,
   evt.con_id
-- evt.event_id,
-- evt.wait_class_id
from
   v$session       ses     join
   v$session_event evt on ses.sid = evt.sid
where
   ses.username = 'RENE'       and
   ses.osuser   = 'rene@tq84'
order by
   evt.time_waited desc
;
