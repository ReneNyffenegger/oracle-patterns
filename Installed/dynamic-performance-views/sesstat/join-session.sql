select
   sess.sid,
   sess.serial#,
   sess.username,
   sess.osuser,
-- sess.osuser,
-- sess.program,
-- sest.sid,
   stat.name,
   sest.value,
   sess.module,
   sess.status
from
   v$session  sess                                         join
   v$sesstat  sest on sess.sid = sest.sid                  join
   v$statname stat on sest.statistic# = stat.statistic#
where
   sess.type   != 'BACKGROUND' and
-- sess.osuser  = 'rene'       and
-- sess.program = 'EXCEL.EXE'  and
   sest.value   >  0           and
   sess.sid     = 1371         and
   stat.name in (
     'consistent gets'      , -- Number of consistent block reads
     'db block gets'        , -- Number of current block reads
     'session logical reads', -- "db block gets" + "consistent gets"
     'consistent changes'   , -- Number of times that rollback was applied to make a consistent read
     'recursive calls'      ,
     'physical reads'       ,
     'redo size'            ,
     'sorts (memory)'       ,
     'sorts (disk)'         ,
     'sorts (rows)'         ,
     'rows processed'
   )
order by
   lower(name);

