select
   frs.tablespace_name,
   to_char(frs.block_id * tbs.block_size /1024/1024 , '999,999.00') start_mb,
   to_char(frs.bytes                     /1024/1024,     '999.00') length_mb,
   fil.file_name
-- frs.file_id
-- tbs.block_size
from
   dba_free_space   frs                                              join
   dba_data_files   fil on frs.file_id         = fil.file_id         join
   dba_tablespaces  tbs on frs.tablespace_name = tbs.tablespace_name
order by
   frs.tablespace_name,
   frs.block_id;
