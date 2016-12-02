select /*+ parallel(16) */
  username,
  tablespace_name,
  round(bytes/1024/1024/1024, 2) gb,
  max_bytes,
  blocks,
  max_blocks
from
  dba_ts_quotas
order by
  username,
  tablespace_name;
