select
--count(*),
  filetype_id,
  filetype_name
from
  v$iostat_file
group by
  filetype_id,
  filetype_name
order by
  lower(filetype_name);
--  4   Archive Log
-- 11   Archive Log Backup
--  1   Control File
--  2   Data File
--  9   Data File Backup
-- 12   Data File Copy
-- 10   Data File Incremental Backup
-- 18   Data Pump Dump File
-- 17   Flashback Log
--  3   Log File
--  0   Other
--  6   Temp File
