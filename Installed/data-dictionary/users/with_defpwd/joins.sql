select
  dp.username,
  dp.product,
  us.account_status,
  us.lock_date,
  us.expiry_date,
  us.oracle_maintained
from
  dba_users_with_defpwd dp   join
  dba_users             us on dp.username = us.username
order by
  us.oracle_maintained desc,
  dp.username;
