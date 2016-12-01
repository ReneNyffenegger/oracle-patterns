select
  owner,
  summary_name,
  container_owner,
  container_name,
  refresh_method,
  contains_views,
  summary,
  unusable,
  restricted_syntax,
  inc_refreshable,
  known_stale,
  query_len
  query,
--last_refresh_scn,
  last_refresh_date,
  fullrefreshtim,
  increfreshtim
from
  dba_summaries
order by
  owner,
  last_refresh_date desc;
