select
   sess.sid,
   sess.serial#,
-- sess.username,
-- sess.osuser,
-- sess.program,
-- sest.sid,
   stat.name,
   sest.value
from
   v$session  sess                                         join
   v$sesstat  sest on sess.sid = sest.sid                  join
   v$statname stat on sest.statistic# = stat.statistic#
where
   sess.osuser  = 'rene'       and
   sess.program = 'EXCEL.EXE'  and
   sest.value   >  0
order by
   lower(name);
