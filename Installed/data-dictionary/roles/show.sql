select
  role,
  password_required,
  authentication_type,
  common,
  oracle_maintained
from
  dba_roles
order by
  oracle_maintained,
  role;
