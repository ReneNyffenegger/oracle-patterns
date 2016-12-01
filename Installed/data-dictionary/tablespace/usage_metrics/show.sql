select
  tablespace_name,
  used_space,
  tablespace_size,
  to_char(used_percent, '990.00') used_percent
from
  dba_tablespace_usage_metrics m
order by
  m.used_percent desc;
