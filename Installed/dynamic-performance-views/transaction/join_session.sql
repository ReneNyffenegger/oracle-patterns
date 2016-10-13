select 
  trx.addr,
  ses.taddr,  
  trx.ses_addr,
  ses.saddr,
  case when       trx.addr != ses.taddr then 'trx.addr != ses.taddr' end cmp_taddr
from
  v$transaction      trx                             left join
  v$session          ses on trx.ses_addr = ses.saddr;
