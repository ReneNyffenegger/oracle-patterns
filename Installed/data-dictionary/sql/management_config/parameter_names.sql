select
  lower(parameter_name)
from
  dba_sql_management_config
order by
  parameter_name;
--
-- plan_retention_weeks
-- space_budget_percent
