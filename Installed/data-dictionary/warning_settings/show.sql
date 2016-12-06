select
  owner,
  object_name,
  object_type,
  warning,
  setting,
  object_id
from
  dba_warning_settings
order by
  owner,
  object_name,
  object_type;
