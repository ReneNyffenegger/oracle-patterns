select
  comp_id,
  comp_name,
  schema,
  procedure,
  version,
  status,
  modified,
  namespace,
  other_schemas
from
  dba_registry
order by
  lower(comp_name);
