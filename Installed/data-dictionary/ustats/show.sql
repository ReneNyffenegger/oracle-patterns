select
  object_owner,
  object_name,
  partition_name,
  object_type,
  association,
  column_name,
  statstype_schema,
  statstype_name,
  statistics
from
  dba_ustats
order by
  object_owner,
  object_name;
