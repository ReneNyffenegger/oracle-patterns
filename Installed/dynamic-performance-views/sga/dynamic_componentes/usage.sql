select
  component,
  to_char(current_size / 1024/1024, '999,999') size_mb
from
  v$sga_dynamic_components
order by
  current_size desc;
