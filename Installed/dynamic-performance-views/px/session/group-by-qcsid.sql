select
  count(*),
  pxs.qcsid,
  spx.osuser,
  spx.username,
  max(case when spx.sid = pxs.qcsid then spx.program end) program,
  spx.module,
  round((sysdate - min(spx.sql_exec_start)) * 24*60*60) sql_start_s_ago,
  round(max(spx.wait_time_micro) / 1000/1000, 2) max_wait_s,
  round(min(spx.wait_time_micro) / 1000/1000, 2) min_wait_s,
  max(spx.event) keep (dense_rank first order by spx.wait_time_micro desc) event_max_waited,
  sql.sql_text,
  max(pxs.qcserial#)   qcserial#,
  count(         spx.taddr)     cnt_txn,
  count(distinct spx.taddr)     cnt_dist_txn
from
  v$px_session  pxs                                    join
  v$session     spx on pxs.sid     = spx.sid and
                       pxs.serial# = spx.serial#  left join
  v$sqlarea     sql on spx.sql_id  = sql.sql_id
where
  spx.osuser = 'rnyffenegger'
group by
  spx.osuser,
  spx.username,
  spx.module,
  sql.sql_text,
  pxs.qcsid
--pxs.qcserial#
order by
  count(*) desc;
