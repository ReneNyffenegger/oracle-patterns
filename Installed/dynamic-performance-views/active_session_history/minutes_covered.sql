select
  extract(second from sysdate          - max(sample_time)) seconds_since_most_recent ,
  extract(minute from sysdate          - min(sample_time)) minutes_since_least_recent,
  extract(minute from max(sample_time) - min(sample_time)) minutes_covered
from
  v$active_session_history;
