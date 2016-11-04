select
  grantee,
  path_of_connect_role_grant,
  admin_opt
from
  dba_connect_role_grantees
order by
  grantee;
