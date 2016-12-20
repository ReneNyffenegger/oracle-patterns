select
  listagg(t.sql_text, '') within group (order by t.piece)
from
  v$sqltext_with_newlines t
where
  t.sql_id = '...';
