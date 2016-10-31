select
  count(*),
  spx.osuser,
  spx.username,
  sql.sql_text,
  pxs.qcsid,
  pxs.qcserial#
from
  v$px_session  pxs                                    join
  v$session     spx on pxs.sid     = spx.sid and
                       pxs.serial# = spx.serial#  left join
  v$sqlarea     sql on spx.sql_id  = sql.sql_id
group by
  spx.osuser,
  spx.username,
  sql.sql_text,
  pxs.qcsid,
  pxs.qcserial#
order by
  count(*) desc;
