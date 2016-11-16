select
  owner,
  table_name,
  column_name,
  hidden_column,
  virtual_column,
  data_type,
  qualified_col_name,
  column_id,
  internal_column_id,
  segment_column_id
from
  dba_tab_cols
where
  hidden_column  <> 'NO' or
  virtual_column <> 'NO'
order by
  owner,
  table_name,
  column_id;
