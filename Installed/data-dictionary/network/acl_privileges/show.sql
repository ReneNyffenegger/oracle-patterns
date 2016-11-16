select
  prv.principal,
  prv.privilege,
  acl.host,
  acl.lower_port,
  acl.upper_port,
--acl.acl,
  prv.is_grant,
  prv.invert,
  prv.start_date
from
  dba_network_acl_privileges  prv  join
  dba_network_acls            acl on prv.aclid = acl.aclid
order by
  prv.principal,
  prv.privilege;
