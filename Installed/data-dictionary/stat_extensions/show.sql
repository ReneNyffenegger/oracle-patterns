select
  owner,
  table_name,
  extension_name,
  extension,
  creator,
  droppable
from
  dba_stat_extensions
order by
  owner,
  table_name;
