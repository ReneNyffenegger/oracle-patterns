select
--count(*),
  wait_class#,
  wait_class
from
  v$event_name
group by
  wait_class#,
  wait_class
order by
  wait_class#;
--  0 Other
--  1 Application
--  2 Configuration
--  3 Administrative
--  4 Concurrency
--  5 Commit
--  6 Idle
--  7 Network
--  8 User I/O
--  9 System I/O
-- 10 Scheduler
-- 11 Cluster
-- 12 Queueing
