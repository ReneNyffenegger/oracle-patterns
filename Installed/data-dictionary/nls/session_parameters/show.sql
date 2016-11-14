select
  lower(parameter) parameter,
  lower(value    ) value
from
  nls_session_parameters
order by
  parameter;
