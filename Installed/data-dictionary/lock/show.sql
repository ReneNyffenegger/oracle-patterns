select
  ses.sid,
  ses.serial#,
  ses.username,
  ses.osuser,
  ses.status,
  ses.program,
  ses.logon_time,
  ses.event,
  lck.lock_type,
  lck.mode_held,
  lck.mode_requested,
  lck.lock_id1,
  lck.lock_id2,
  lck.last_convert,
  lck.blocking_others
from
  dba_lock  lck  left join
  v$session ses              on lck.session_id = ses.sid
where
  ses.osuser = 'rnyffenegger'
order by
  ses.username,
  ses.osuser;
