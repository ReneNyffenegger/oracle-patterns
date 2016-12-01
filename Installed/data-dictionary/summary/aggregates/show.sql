select
  owner,
  summary_name,
--position_in_select,
  container_column,
  agg_function,
  distinctflag,
  measure
from
  dba_summary_aggregates
order by
  owner,
  summary_name,
  position_in_select;
