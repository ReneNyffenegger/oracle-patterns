select
   count(*),
   address
from
   v$sqlarea
group by
   address
order by
   count(*) desc;
