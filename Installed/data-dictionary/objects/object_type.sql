select
  object_type
from
  dba_objects
group by
  object_type
order by
  count(*) desc;
