select
  owner,
  table_name,
  count
from
  dba_unused_col_tabs
order by
  owner,
  table_name;
