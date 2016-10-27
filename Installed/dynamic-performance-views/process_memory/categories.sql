select
--count(*),
  category
from
  v$process_memory
group by
  category
order by
  category;
-- Freeable
-- Other
-- PL/SQL
-- SQL
