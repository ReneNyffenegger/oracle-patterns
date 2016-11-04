select
  granted_role,
  admin_option,
  default_role
from
  dba_role_privs
where
  grantee = 'RNYFFENEGGER'
order by
  granted_role;
