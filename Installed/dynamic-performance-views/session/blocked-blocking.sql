select 
  ses.sid                      blocked_sid,
  ses.username                 blocked_username,
  ses.osuser                   blocked_osuser,
  ses.blocking_session_status  blocked_session_status, -- VALID:There is a blocking session
  --
  bls.sid                      blocking_sid,
  bls.username                 blocking_username,
  bls.osuser                   blocking_osuser,
  --
  ses.event                    blocked_event,
  bls.event                    blocking_event,
  --
  ses.sql_id                   blocked_sql_id,
  bls.sql_id                   blocking_sql_Id
from
  gv$session ses                                           join
  gv$session bls on ses.blocking_session  = bls.sid  and
                    ses.blocking_instance = bls.inst_id;
