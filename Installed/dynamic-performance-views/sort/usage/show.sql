select
  sou.username,
--ses.username,  
--ses.osuser  ,
--ses.sql_id,
--sou.sql_id,
  sou.tablespace,
  sou.contents,
  sou.segtype,
  sou.segfile#,
  sou.segblk#,
  sou.extents,
  sou.blocks,
  nvl(sqa.sql_text,sou.sql_id)  sql_text
from
  v$sort_usage    sou                                            join
  v$session       ses on sou.session_addr = ses.saddr and
                         sou.session_num  = ses.serial#     left join
                        
  v$sqlarea       sqa on sou.sql_id       = sqa.sql_id
order by
  ses.sid
;
