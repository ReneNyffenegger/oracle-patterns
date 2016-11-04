select /*+ parallel(16) */
  logon__.os_user,
  logon__.db_user,
  logon__.extended_timestamp,
  logoff_.extended_timestamp,
  logon__.session_id
from
  dba_common_audit_trail logon__                                                      left join
  dba_common_audit_trail logoff_ on logon__.session_id     =  logoff_.session_id and
                                    logoff_.statement_type = 'LOGOFF'
where
  logon__.os_user        = 'rnyffenegger' and
  logon__.statement_type = 'LOGON'
order by
  logon__.extended_timestamp desc;
