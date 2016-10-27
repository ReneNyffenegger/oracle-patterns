select 
  distinct statistic_name
from
  v$segment_statistics
order by
  statistic_name;
-- buffer busy waits
-- db block changes
-- gc buffer busy
-- gc cr blocks received
-- gc current blocks received
-- ITL waits
-- logical reads
-- optimized physical reads
-- physical read requests
-- physical reads
-- physical reads direct
-- physical write requests
-- physical writes
-- physical writes direct
-- row lock waits
-- segment scans
-- space allocated
-- space used
