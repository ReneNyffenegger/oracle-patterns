select
  owner,
  summary_name,
  position_in_select,
  container_column,
  detailobj_owner,
  detailobj_name,
  detailobj_alias,
  detailobj_type,
  detailobj_column
from
  dba_summary_keys
order by
  owner,
  summary_name,
  position_in_select;
