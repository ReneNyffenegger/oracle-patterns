select
  owner,
  table_name
from
  dba_logstdby_unsupported_table
order by
  owner,
  table_name;
