select
  count(*),
  account_status
from
  dba_users
group by
  account_status
order by
  account_status;
