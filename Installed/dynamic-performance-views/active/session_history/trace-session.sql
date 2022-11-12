--
--     Trace a specfic session. Group long running SQL
--     statements.
--
select
   count(*)                                     cnt_samples,
   min(ash.sample_id)                           min_sample_id,
   max(ash.sample_id)                           max_sample_id,
   to_char(min(ash.sample_time), 'hh24:mi:ss')  sql_start,
   to_char(max(ash.sample_time), 'hh24:mi:ss')  sql_end,
   round ((cast(max(ash.sample_time) as date) -
           cast(min(ash.sample_time) as date))
     * 24 * 60 * 60 )                           sql_seconds,
   ash.sql_id,
   ash.sql_exec_id,
   sql.sql_text
from
   v$active_session_history ash                            left join
   v$sqlarea                sql on ash.sql_id = sql.sql_id
where
   ash.session_id      =    351    and
   ash.session_serial# =  49863
group by
   ash.sql_id,
   ash.sql_exec_id,
   sql.sql_text
order by
   min(ash.sample_id) desc
;
