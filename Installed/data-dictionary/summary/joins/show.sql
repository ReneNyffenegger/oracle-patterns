select
  owner,
  summary_name,
  detailobj1_owner,
  detailobj1_relation,
  detailobj1_column,
  operator,
  detailobj2_owner,
  detailobj2_relation,
  detailobj2_column
from
  dba_summary_joins
order by
  owner,
  summary_name;
