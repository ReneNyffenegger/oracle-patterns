select
  owner,
  name,
  type,
  source_size,
  parsed_size,
  code_size,
  error_size
from
  dba_object_size
order by
  owner,
  greatest(source_size, parsed_size, code_size) desc;
