select
  owner,
  name,
  type,
  mode_held,
  mode_requested,
  session_id
from
  dba_ddl_locks
order by
  case mode_requested
       when 'Exclusive' then 1
       when 'Share'     then 2
       when 'None'      then 3
       else                  4 end,
  owner,
  name
;
