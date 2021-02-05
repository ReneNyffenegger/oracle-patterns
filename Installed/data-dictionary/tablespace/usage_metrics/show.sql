select
   tsm.tablespace_name,
   round(tsm.used_space       / 1024/1024,1)  used_space_mb,
   round(ts.max_size          / 1024/1024,1)  max_size_mb,
   round(tsm.tablespace_size  / 1024/1024,1)  size_mb,
   to_char(tsm.used_percent, '990.00')        used_percent,
   ts.block_size              / 1024          block_size_kb,
   ts.logging,
   ts.def_tab_compression,
   ts.compress_for
from
   dba_tablespace_usage_metrics tsm  join
   dba_tablespaces              ts on tsm.tablespace_name = ts.tablespace_name
order by
   tsm.used_percent desc;
