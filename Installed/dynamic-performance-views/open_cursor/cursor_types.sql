select
--count(*),
  cursor_type
from
  v$open_cursor
group by
  cursor_type
order by
  cursor_type;
-- BUNDLE DICTIONARY LOOKUP CACHED
-- DICTIONARY LOOKUP CURSOR CACHED
-- OPEN
-- OPEN-PL/SQL
-- OPEN-RECURSIVE
-- PL/SQL CURSOR CACHED
-- SESSION CURSOR CACHED
