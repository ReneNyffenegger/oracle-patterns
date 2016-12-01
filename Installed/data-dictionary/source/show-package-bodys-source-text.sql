select
  text
from
  dba_source
where
  name          = 'STANDARD'      and
  type          = 'PACKAGE BODY'  and
  origin_con_id = 0
order by
  line;
