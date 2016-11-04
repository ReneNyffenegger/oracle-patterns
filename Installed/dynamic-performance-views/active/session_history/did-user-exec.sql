--
--     Did a specific user execute a specific
--     SQL statement recently?
--

select
  to_char(ash.sample_time, 'hh24:mi:ss') ash_tm,
  ash.session_id,
  ash.session_serial#,
  sql.sql_text
from
  dba_users                usr                              join
  v$active_session_History ash on usr.user_id = ash.user_id join
  v$sqlarea                sql on ash.sql_id  = sql.sql_id
where
  lower(sql.sql_text) like '%&sql_stmt%' and
  usr.username = '&username';
