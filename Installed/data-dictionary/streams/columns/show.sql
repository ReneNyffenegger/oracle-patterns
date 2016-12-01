select
  owner,
  table_name,
  column_name,
  sync_capture_version,
  sync_capture_reason,
  apply_version,
  apply_reason
from
  dba_streams_columns
order by
  owner,
  table_name,
  column_name;
