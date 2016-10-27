select
  maximum,
 (select value from v$parameter2 where name = 'session_cached_cursors') session_cached_cursors,
  count,
  opens,
  hits,
  hit_ratio
from
  v$session_cursor_cache;
