select
  stat_name,
  to_char(value/1024/1024, '999,999,990.00') seconds
from
  v$sys_time_model
order by
  value desc;
