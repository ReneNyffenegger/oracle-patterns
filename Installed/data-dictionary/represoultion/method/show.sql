select
  conflict_type,
  method_name
from
  dba_represolution_method
order by
  conflict_type,
  method_name;
