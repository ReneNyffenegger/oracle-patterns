select
  p.name,
  substr(dbms_stats.get_prefs(upper(p.name)), 1, 30) val
from (
  select 'autostats_target'            name from dual union all
  select 'cascade'                     name from dual union all
  select 'concurrent'                  name from dual union all
  select 'degree'                      name from dual union all
  select 'estimate_percent'            name from dual union all
  select 'method_opt'                  name from dual union all
  select 'no_invalidate'               name from dual union all
  select 'granularity'                 name from dual union all
  select 'publish'                     name from dual union all
  select 'incremental'                 name from dual union all
  select 'incremental_staleness'       name from dual union all
  select 'incremental_level'           name from dual union all
  select 'stale_percent'               name from dual union all
  select 'global_temp_table_stats'     name from dual union all
--select 'table_cached_blockes'        name from dual union all
  select 'options'                     name from dual
) p;
