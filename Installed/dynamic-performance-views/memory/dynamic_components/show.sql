select
  component,
  round(        current_size /1024/1024, 1)     curr_size_mb,
  round(            min_size /1024/1024, 1)      min_size_mb,
  round(            max_size /1024/1024, 1)      max_size_mb,
  round( user_specified_size /1024/1024, 1)     spec_size_mb,
  oper_count,
  last_oper_type,
  last_oper_mode,
  round(((sysdate - last_oper_time) * 24 * 60)) last_oper_minutes_ago,
  round(        granule_size /1024/1024, 1)     gran_size_mb
from
  v$memory_dynamic_components
order by
  lower(component);
