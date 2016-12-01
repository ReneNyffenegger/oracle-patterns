select
  owner,
  table_name,
  reason,
  auto_filtered
from
  dba_streams_unsupported
order by
  owner,
  table_name;
