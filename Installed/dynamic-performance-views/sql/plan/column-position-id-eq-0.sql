select *
from
   v$sql_plan
where
   id = 0 and
   nvl(position, -1) <> nvl(cost,-1)
;
