select
  lower(parameter) parameter,
  lower(value    ) value
from
  nls_instance_parameters
order by
  parameter;
