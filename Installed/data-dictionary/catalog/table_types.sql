select
--count(*),
  lower(table_type) table_type
from
  dba_catalog
group by
  table_type
order by
  table_type;
--
-- sequence
-- synonym
-- table
-- view
