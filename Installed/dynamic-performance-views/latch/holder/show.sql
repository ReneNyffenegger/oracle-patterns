select
   lah.laddr             latch_address,
   lah.name              latch_name,
   prc.latchwait,
   prc.latchspin,
   prc.pname,
   prc.username          prc_username,
   ses.username          ses_username,
   ses.osuser,
   lah.gets
from
   v$latchholder lah                         join
   v$session     ses on lah.sid = ses.sid    join
   v$process     prc on lah.pid = prc.pid;
