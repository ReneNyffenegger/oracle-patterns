select
  owner,
  table_name,
  column_name,
  privilege,
  grantable
from
  role_tab_privs
where
  role = 'R_DEVELOP'
order by
  owner,
  table_name,
  column_name nulls last,
  privilege;
