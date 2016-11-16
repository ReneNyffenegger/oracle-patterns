select
  lower(parameter) parameter,
  lower(value    ) value
from
  nls_database_parameters
order by
  parameter;
