select
-- sql.last_load_time,
   sql.last_active_time,
-- sql.first_load_time,
   sql.sql_id,
   sql.sql_text
-- sql.*
from
   v$sqlarea   sql                                        join
   dba_users   usr on sql.parsing_user_id = usr.user_id
where
   usr.username = 'RENE'
order by
   sql.last_active_time desc;
