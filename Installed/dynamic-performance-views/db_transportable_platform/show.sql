select 
  platform_id,
  platform_name,
  endian_format
from
  v$db_transportable_platform
order by
  lower(platform_name);
