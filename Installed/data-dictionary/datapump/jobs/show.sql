select
  owner_name,
  job_name,
  operation,
  job_mode,
  state,
  degree,
  attached_sessions,
  datapump_sessions
from
  dba_datapump_jobs
order by
  owner_name,
  job_name;
