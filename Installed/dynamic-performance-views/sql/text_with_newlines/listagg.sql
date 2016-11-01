select /* tq84: v$sqltext_with_newlines */
  listagg(t.sql_text, '') within group (order by t.piece)
from
  v$sqlarea                a                          join
  v$sqltext_with_newlines  t on a.sql_id = t.sql_id
 where
  a.sql_text like '%tq84: v$sqltext_with_newlines %'
order by
  t.piece;
