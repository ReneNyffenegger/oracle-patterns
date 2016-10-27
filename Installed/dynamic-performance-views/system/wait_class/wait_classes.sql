select
  wait_class
from
  v$system_wait_class
order by
  wait_class;
--
-- Administrative
-- Application
-- Commit
-- Concurrency
-- Configuration
-- Idle
-- Network
-- Other
-- System I/O
-- User I/O
