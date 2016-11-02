select
  rank() over (order by sum(value) desc) rn,
  stat_name
from
  v$sess_time_model
group by
  stat_name
order by
  stat_name;
--
--  5   DB CPU
--  2   DB time
-- 16   Java execution elapsed time
-- 10   PL/SQL compilation elapsed time
--  9   PL/SQL execution elapsed time
-- 16   RMAN cpu time (backup/restore)
--  4   background cpu time
--  1   background elapsed time
-- 12   connection management call elapsed time
-- 16   failed parse (out of shared memory) elapsed time
-- 13   failed parse elapsed time
-- 11   hard parse (bind mismatch) elapsed time
--  8   hard parse (sharing criteria) elapsed time
--  7   hard parse elapsed time
-- 16   inbound PL/SQL rpc elapsed time
--  6   parse time elapsed
-- 14   repeated bind elapsed time
-- 15   sequence load elapsed time
--  3   sql execute elapsed time
