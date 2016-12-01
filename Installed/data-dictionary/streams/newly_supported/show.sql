select
  owner,
  table_name,
  reason,
  compatible
from
  dba_streams_newly_supported
order by
  owner,
  table_name;
