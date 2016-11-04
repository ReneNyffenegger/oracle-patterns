select
   status,
   online_status,
   tablespace_name,
   to_char(bytes       /1024/1024, '999,999.00') mb,
   to_char(user_bytes  /1024/1024, '999,999.00') user_mb,
   to_char(maxbytes    /1024/1024, '999,999.00') max_mb,
-- blocks,
-- user_blocks
   file_id,
   relative_fno,
   increment_by,
   file_name
from
   dba_data_files
order by
   status,
   online_status,
   tablespace_name;
