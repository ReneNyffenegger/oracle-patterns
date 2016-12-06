select
  owner,
  table_name,
  column_name,
  insertable,
  deletable
from
  dba_updatable_columns
order by
  owner,
  table_name,
  column_name;
