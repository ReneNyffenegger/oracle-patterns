select
  schema,
  namespace,
  package,
  type
from
  dba_context
order by
  schema,
  namespace;
