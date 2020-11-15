select
-- sql.last_active_time,
   round((sysdate - sql.last_active_time) * 24*60*60) last_active_secs_ago,
-- sql.first_load_time,
   sql.sql_id,
   sql.sql_text,
   sql.executions,
   sql.parse_calls,
   sql.last_load_time,
   sql.*
from
   v$sqlarea   sql                                        join
   dba_users   usr on sql.parsing_user_id = usr.user_id
where
   usr.username = user
order by
   sql.last_active_time desc
;
