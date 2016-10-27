select
  sci.authentication_type,
  sci.osuser,
  sci.client_charset,
  sci.client_connection,
  sci.client_oci_library,
  sci.client_version,
  sci.client_driver,
  sci.client_lobattr,
  sci.network_service_banner,
  sci.client_regid
from
  v$session              ses join
  v$session_connect_info sci on ses.sid = sci.sid
where
  ses.audsid = sys_context('userenv', 'sessionid');
