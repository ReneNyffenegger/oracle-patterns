select
  transformation_id,
  owner,
  name,
  from_type,
  to_type
from
  dba_transformations
order by
  owner,
  name;
