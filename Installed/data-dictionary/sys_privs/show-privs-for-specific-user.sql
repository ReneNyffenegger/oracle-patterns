select
   privilege,
   admin_option
from
  dba_sys_privs
where
  grantee = 'RNYFFENEGGER';
