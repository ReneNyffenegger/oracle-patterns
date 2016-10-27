select
  usr.username,
  usr.user_id,
  pwf.sysdba,
  pwf.sysoper,
  pwf.sysasm
--pwf.sysbackup,
--pwf.sysdg,
--pwf.syskm
from
  dba_users          usr                                  left join
  v$pwfile_users     pwf on usr.username = pwf.username
;
