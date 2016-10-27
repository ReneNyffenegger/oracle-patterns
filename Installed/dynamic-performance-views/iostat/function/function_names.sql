select
  function_id,
  function_name
from
  v$iostat_function
order by
  lower(function_name);
-- 3   ARCH
--12   Archive Manager
-- 8   Buffer Cache Reads
-- 6   Data Pump
-- 1   DBWR
-- 9   Direct Reads
--10   Direct Writes
-- 2   LGWR
--13   Others
-- 7   Recovery
-- 0   RMAN
--11   Smart Scan
-- 5  Streams AQ
-- 4   XDB
