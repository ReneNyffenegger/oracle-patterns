select
 -- lop.sid,
 -- lop.serial#,
    lop.opname,
    lop.target,
    lop.target_desc,
    lop.sofar,
    lop.totalwork,
    round( (sysdate - lop.start_time      ) * 24*60*60) started_s_ago,
    round( (sysdate - lop.last_update_time) * 24*60*60) updated_s_ago,
    lop.elapsed_seconds,
    lop.message,
    sql.sql_text
from
  v$session_longops lop         left join
  v$sqlarea         sql on lop.sql_id = sql.sql_id
-- where sid = ...
order by
  start_time desc;
