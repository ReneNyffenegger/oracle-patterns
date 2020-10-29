select /*+ ordered */
-- ses.sid,
-- ses.saddr,
-- ses.serial#,
   ses.program,
-- ses.osuser,
   ses.event,
   round(ses.wait_time_micro/1000/1000, 2) wait_s,   
-- ses.sql_id,
-- ses.prev_sql_id,
   ses.logon_time,
   substr(sql.sql_text, 1, 50)             cur_sql_text,
   substr(sqp.sql_text, 1, 50)             prev_sql_text
from
   v$session  ses                                    left join
   v$sqlarea  sql on ses.sql_id      = sql.sql_id    left join
   v$sqlarea  sqp on ses.prev_sql_id = sqp.sql_id
where
  osuser   = 'rene'          and
--program  = 'SQL Developer' and
  program  = 'sqlplus.exe';
