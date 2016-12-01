select
  owner,
  table_name,
  comments,
  table_type,
  origin_con_id
from
  dba_tab_comments
where
  comments is not null
order by
  owner,
  table_name
;
