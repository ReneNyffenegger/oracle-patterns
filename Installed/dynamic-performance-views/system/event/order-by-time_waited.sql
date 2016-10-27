select *
from
  v$system_event
order by
  time_waited desc;
