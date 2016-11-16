select
  owner_name,
  job_name,
  inst_id,
  saddr,
  session_type
from
  dba_datapump_sessions
order by
  owner_name,
  job_name;
