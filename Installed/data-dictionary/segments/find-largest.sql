select /*+ parallel(16) */
  round(bytes / 1024/1024/1024, 2) size_gb,
  owner,
  segment_name,
  tablespace_name,
  segment_type,
  segment_subtype
from
  dba_segments
order by
  bytes desc nulls last;
