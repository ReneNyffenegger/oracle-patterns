select
  ses.sid,
  sys_context('userenv', 'sid'      ) ctx_sid,
  ses.audsid,
  sys_context('userenv', 'sessionid') ctx_sessionid
from
  v$session ses
where
  ses.sid    = sys_context('userenv', 'sid'      ) or
  ses.audsid = sys_context('userenv', 'sessionid');
