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
   sess.sid     = 574          and
   stat.name in (
     'recursive calls',
     'db block gets'  ,
     'consistent gets',
     'physical reads' ,
     'redo size'      ,
     'sorts (memory)' ,
     'sorts (disk)'   ,
     'rows processed'
   )
order by
   lower(name);
