select /*+ ordered */
  ses.sid,
  ses.logon_time   ses_logontime,
  prc.pid          prc_pid,        -- Oracle process identifier
--prc.sosid        prc_sosid,      -- OS process/thread identifier
  prc.spid         prc_spid,       -- OS process identifier
--prc.stid         prc_stid,       -- OS thread identifier
--ses.paddr        prc_addr,
--ses.taddr        trx_addr,
  trx.start_time   trx_start_time,
  case when pxs.sid is not null then
    case
      when ses.sid = pxs.qcsid then 'Query coordinator'
      else 'Query server, QC is ' || pxs.qcsid
    end
  end  parallel_info,
  sqc.command_name,
--aud.name         aud_name,
  sql.sql_text     sql_text
from
  v$session     ses                                                   join
  v$process     prc on ses.paddr           = prc.addr            left join
  v$transaction trx on ses.taddr           = trx.addr            left join
  v$sql         sql on ses.sql_address     = sql.address      and  
                       ses.sql_hash_value  = sql.hash_value      left join
  v$sqlcommand  sqc on ses.command         = sqc.command_type    left join
  v$px_session  pxs on ses.sid             = pxs.sid          and
                       ses.serial#         = pxs.serial#         left join
  audit_actions aud on ses.command         = aud.action
order by
  ses.sid
;
