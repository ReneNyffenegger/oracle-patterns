select
   lower(attribute_name) name
from
   dba_scheduler_global_attribute
order by
   lower(attribute_name);
