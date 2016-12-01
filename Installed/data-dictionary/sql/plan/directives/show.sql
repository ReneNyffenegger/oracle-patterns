select
  directive_id,
  type,
  enabled,
  auto_drop,
  reason,
  to_char(created      , 'dd.mm.yy hh24:mi:ss') created,
  to_char(last_modified, 'dd.mm.yy hh24:mi:ss') last_modified,
  to_char(last_used    , 'dd.mm.yy hh24:mi:ss') last_used
--notes
from
  dba_sql_plan_directives
order by
  created desc;
