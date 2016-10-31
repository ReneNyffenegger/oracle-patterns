select
  to_char(sum(sharable_mem  ) / 1024/1024, '999,999')   total_sharable_mem_mb,
  to_char(sum(persistent_mem) / 1024/1024, '999,999')   total_persistent_mem_mb,
  to_char(sum(runtime_mem   ) / 1024/1024, '999,999')   total_runtime_mem_mb
from
  v$sqlarea;
