--
--     Trace a specfic session. Group long running SQL
--     statements.  
--
select
   count(*)                                cnt_samples,
   min(sample_id)                          min_sample_id,
   max(sample_id)                          max_sample_id,
   to_char(min(sample_time), 'hh24:mi:ss') sql_start,
   to_char(max(sample_time), 'hh24:mi:ss') sql_end,
   round ((cast(max(sample_time) as date) - 
           cast(min(sample_time) as date))
     * 24 * 60 * 60 )                      sql_seconds,
   sql_id,
   sql_text 
from (
  select
    sum(new_stmt) over (order by sample_id) stmt_cntr,
    sql_id,
    sample_id,
    sample_time,
    sql_text
  from (
    select
      ash.sql_id,
      ash.sample_id,
      case when ash.sql_id != lag(ash.sql_id) over (order by ash.sample_id) then 1 else 0 end new_stmt,
      ash.sample_time,
      sql.sql_text
    from
      v$active_session_history  ash                            left join
      v$sqlarea                 sql on ash.sql_id = sql.sql_id
    where
      ash.session_id      = &sid     and
      ash.session_serial# = &serial
  )
)
group by
  stmt_cntr, 
  sql_id,
  sql_text
order by
  min(sample_id) desc
;
