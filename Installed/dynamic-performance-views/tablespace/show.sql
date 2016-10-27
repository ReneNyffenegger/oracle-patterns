select
  ts#,
  name,
  included_in_database_backup,
  bigfile,
  flashback_on,
  encrypt_in_backup
from
  v$tablespace
order by
  name;
