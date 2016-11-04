select
  role,
  privilege,
  admin_option
from
  role_sys_privs
where
  role in ('CONNECT', 'RESOURCE')
order by
  role,
  privilege;
