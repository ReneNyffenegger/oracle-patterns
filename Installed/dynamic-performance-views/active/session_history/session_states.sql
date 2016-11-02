select
--count(*),
  session_state
from
  v$active_session_History
group by
  session_state;
--
-- WAITING
-- ON CPU
