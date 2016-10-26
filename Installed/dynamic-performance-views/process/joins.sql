select
  prc.pid,
  prc.serial#,
  prc.program,
  bgp.description bg_process,
  pxp.status      px_status
from
  v$process     prc                        left join
  v$px_process  pxp on prc.pid  = pxp.pid  left join
  v$bgprocess   bgp on prc.addr = bgp.paddr; 
