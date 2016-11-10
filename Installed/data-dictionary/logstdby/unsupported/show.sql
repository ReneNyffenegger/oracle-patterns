select
  owner,
  table_name,
  column_name,
  attributes,
  data_type
from
  dba_logstdby_unsupported
order by
  owner,
  table_name,
  column_name;
