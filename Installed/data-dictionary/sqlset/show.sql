select
  id,
  owner,
  name,
  description,
  statement_count,
  con_dbid,
  created,
  last_modified
from
  dba_sqlset
order by
  owner,
  created desc;
