select /* tq84-tq84 */
  t.sql_text
from
  v$sqlarea  a join
  v$sqltext  t on a.sql_id = t.sql_id
 where
  a.sql_text like '%tq84-tq84%'
order by
  t.piece;
