select
  prc.pid,
  prc.serial#,
  prc.program,
  pxp.status    px_status
from
  v$process     prc                       left join
  v$px_process  pxp on prc.pid = pxp.pid;
