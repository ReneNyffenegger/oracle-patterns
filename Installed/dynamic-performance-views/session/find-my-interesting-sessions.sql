select /*+ ordered */
  ses.sid,
  ses.serial#,
  ses.program,
  ses.osuser,
  ses.event,
  round(ses.wait_time_micro/1000/1000, 2) wait_s,
  sql.sql_text
from
  v$session  ses  left join
  v$sqlarea  sql on ses.sql_id = sql.sql_id
where
--username = 'RNYFF'         and
  osuser   = 'rnyffenegger'  and
--program  = 'SQL Developer' and
  program  = 'sqlplus.exe';
