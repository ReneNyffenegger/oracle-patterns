select
  timestamp,
  cpu_count,
  cpu_core_count,
  cpu_socket_count,
  version,
  dbid
from
  dba_cpu_usage_statistics
order by
  timestamp desc;
