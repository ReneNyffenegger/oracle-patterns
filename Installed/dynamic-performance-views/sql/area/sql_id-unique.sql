--
--  sql_id is unique in v$sqlarea:
--
select
  count(*),
  sql_id
from
  v$sqlarea
group by
  sql_id
order by
  count(*) desc;
