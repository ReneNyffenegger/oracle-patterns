select 
  lower(resource_name),
  limit
from
  user_resource_limits
order by
  lower(resource_name);
