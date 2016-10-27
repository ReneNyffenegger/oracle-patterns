select
  stat_name
from
  v$sys_time_model
order by
  lower(stat_name);
--
-- background cpu time
-- background elapsed time
-- connection management call elapsed time
-- DB CPU
-- DB time
-- failed parse (out of shared memory) elapsed time
-- failed parse elapsed time
-- hard parse (bind mismatch) elapsed time
-- hard parse (sharing criteria) elapsed time
-- hard parse elapsed time
-- inbound PL/SQL rpc elapsed time
-- Java execution elapsed time
-- parse time elapsed
-- PL/SQL compilation elapsed time
-- PL/SQL execution elapsed time
-- repeated bind elapsed time
-- RMAN cpu time (backup/restore)
-- sequence load elapsed time
-- sql execute elapsed time
