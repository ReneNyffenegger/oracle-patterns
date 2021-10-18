select
   pxs.qcsid,
-- spx.osuser,
-- spx.username,
-- spx.program,
-- spx.module,
   round((sysdate -         spx.sql_exec_start                    ) * 24*60*60) sql_start_s_ago,
   round((sysdate - to_date(trx.start_time, 'mm/dd/rr hh24:mi:ss')) * 24*60*60) trx_start_s_ago,
   round(spx.wait_time_micro / 1000/1000, 2) max_wait_s,
   trx.used_ublk,
   trx.used_urec,
   spx.event,
   -----------------------
   slo.opname               slo_opname,
   slo.target               slo_target,
   slo.sofar                slo_sofar,
   slo.totalwork            slo_totalwork,
   slo.elapsed_seconds      slo_elapsed_sconds,
-- round((sysdate -         slo.start_time                        ) * 24*60*60) slo_start_s_ago,
   slo.time_remaining       slo_time_remaining,
   -----------------------
   sql.sql_text,
   pxs.qcserial#   qcserial#
from
   v$px_session      pxs                                         join
   v$session         spx on pxs.sid     = spx.sid      and
                            pxs.serial# = spx.serial#       left join
   v$sqlarea         sql on spx.sql_id  = sql.sql_id        left join
   v$transaction     trx on spx.taddr   = trx.addr          left join
   v$session_longops slo on spx.sid     = slo.sid      and
                            spx.serial# = slo.serial#
where
-- spx.osuser = 'rnyffenegger'
   pxs.qcsid  =  1661
order by
    pxs.qcsid,
    slo.time_remaining desc
;
