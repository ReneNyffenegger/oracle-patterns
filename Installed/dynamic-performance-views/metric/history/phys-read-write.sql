select
   begin_time,
   round(avg_sess_cnt, 1            ) avg_sess_cnt,
   sessions,
   round(exec_per_sec , 2           ) exec_per_sec         ,
   round(phys_read_b_per_sec  / 1024) phys_read_kb_per_sec ,
   round(phys_reads_per_sec         ) phys_read_per_sec    ,
   --
   round(phys_write_b_per_sec / 1024) phys_write_kb_per_sec,
   round(phys_writes_per_sec        ) phys_writes_per_sec  ,
   --
   round(case when phys_reads_per_sec  > 0 then phys_read_b_per_sec  / phys_reads_per_sec  / 1024 end) kb_read_per_phys_read , -- expected to be block size
   round(case when phys_writes_per_sec > 0 then phys_write_b_per_sec / phys_writes_per_sec / 1024 end) kb_write_per_phys_read,
   cnt
from (
select
   begin_time,
   end_time,
   max (case when metric_name = 'Physical Read Bytes Per Sec'  then value end) phys_read_b_per_sec,
   max (case when metric_name = 'Physical Reads Per Sec'       then value end) phys_reads_per_sec,
   max (case when metric_name = 'Physical Write Bytes Per Sec' then value end) phys_write_b_per_sec,
   max (case when metric_name = 'Physical Writes Per Sec'      then value end) phys_writes_per_sec,
   max (case when metric_name = 'Executions Per Sec'           then value end) exec_per_sec,
   max (case when metric_name = 'Average Active Sessions'      then value end) avg_sess_cnt,
   max (case when metric_name = 'Session Count'                then value end) sessions,
   count(*) cnt -- expected to be 7
from
   v$metric_history
where
   metric_name in (
         --
         --  select * from v$metric where group_id = 18;
         --
      'Physical Read Bytes Per Sec' ,
      'Physical Reads Per Sec'      ,
      'Physical Write Bytes Per Sec',
      'Physical Writes Per Sec'     ,
      'Executions Per Sec'          ,
      'Average Active Sessions'     ,
      'Session Count'
   )
group by
  begin_time,
  end_time
)
order by
  begin_time desc;
