select
  owner,
  object_name,
  param_name,
  param_value,
  object_type,
  origin_con_id
--object_id
from
  dba_stored_settings
order by
  owner,
  object_name;
