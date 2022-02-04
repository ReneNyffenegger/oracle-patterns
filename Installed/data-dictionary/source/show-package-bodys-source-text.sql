select
   line,
   text
from
   dba_source
where
   line between    5 and 15        and
   owner         =  user           and
-- name          = 'STANDARD'      and
   name          = 'TQ84_PKG_B'    and
   type          in ('PACKAGE BODY', 'TYPE BODY', 'PROCEDURE', 'FUNCTION')
-- origin_con_id = 0
order by
   line;
