select
  tablespace_name,
  round(tablespace_size /1024/1204/1024, 2)  size_gb,
  round(allocated_space /1024/1024/1024, 2) alloc_gb,
  round(free_space      /1024/1024/1024, 2)  free_gb
from
  dba_temp_free_space;
