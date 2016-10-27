select
  incarnation#      i,
  status,
  resetlogs_time,
  prior_resetlogs_time,
  resetlogs_id,
  flashback_database_allowed
  resetlogs_change#,
  prior_resetlogs_change#
from
  v$database_incarnation
order by
  incarnation# desc;
