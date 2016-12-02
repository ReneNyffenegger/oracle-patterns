select
  table_owner,
  table_name,
  column_name,
  column_list,
  column_usage,
  trigger_owner,
  trigger_name
from
  dba_trigger_cols
order by
  table_owner,
  table_name,
  column_name;
