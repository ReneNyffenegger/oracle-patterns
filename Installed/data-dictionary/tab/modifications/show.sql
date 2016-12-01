select
  table_owner,
  table_name,
  partition_name,
  subpartition_name,
  inserts,
  updates,
  deletes,
  truncated,
  drop_segments,
  timestamp
from
  dba_tab_modifications
order by
  table_owner,
  timestamp desc;
