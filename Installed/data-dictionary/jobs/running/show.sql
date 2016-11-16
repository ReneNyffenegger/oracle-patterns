select
  jru.sid,
  jru.last_date,
  jru.this_date,
  jbb.log_User,
  jbb.priv_user,
  jbb.schema_user
from
  dba_jobs_running  jru  join
  dba_jobs          jbb  on jru.job = jbb.job;
