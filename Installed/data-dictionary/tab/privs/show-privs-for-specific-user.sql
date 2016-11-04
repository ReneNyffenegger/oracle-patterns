select
  owner,
  table_name,
  grantor,
  privilege,
  grantable,
  hierarchy
from
  dba_tab_privs
where
  grantee = 'RNYFFENEGGER'
order by
  owner,
  table_name,
  privilege;
