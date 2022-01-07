select
   text
from
   dba_source
where
-- owner         =  user           and
   name          = 'STANDARD'      and
   type          = 'PACKAGE BODY'  and
   origin_con_id = 0
order by
   line;
