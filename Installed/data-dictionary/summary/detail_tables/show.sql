select
  owner,
  summary_name,
  detail_owner,
  detail_relation,
  detail_type,
  detail_alias
from
  dba_summary_detail_tables
order by
  owner,
  summary_name;
