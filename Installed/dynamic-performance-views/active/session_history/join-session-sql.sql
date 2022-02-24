select
   ses.sid,
   ses.serial#,
-- ses.program,
   sql.sql_fulltext,
-- ses.osuser
   obj.object_name      obj_name,
   obj.owner            obj_owner,
   ash.*,
   ash.sample_time_utc,
   ash.event,
   ash.session_state,
   ash.usecs_per_row,
   ash.top_level_sql_id,
   ash.sql_exec_id,
   to_char(ash.sql_exec_start, 'yyyy-mm-dd hh24:mi:ss') sql_exec_start
from
   v$session                ses                                                                         join
   v$active_session_history ash on ses.sid = ash.session_id and ses.serial# = ash.session_serial#  left join
   v$sqlarea                sql on ash.top_level_sql_id = sql.sql_id                               left join
   dba_objects              obj on ash.current_obj#     = obj.object_id
--where
-- ses.osuser  = 'RENE'            and
-- ses.program = 'sqldeveloper.exe'
order by
   ash.sample_id desc
;
