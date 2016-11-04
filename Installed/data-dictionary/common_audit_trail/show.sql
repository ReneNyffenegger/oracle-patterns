select /*+ parallel(16) */
-- audit_type,
-- session_id,
-- proxy_sessionid,
-- statementid,
-- entryid,
   extended_timestamp,
-- global_uid,
   db_user,
   priv_used,          -- System privilege used to execute the action
   sql_text,
   client_id,
-- econtext_id,
-- ext_name,
   os_user,
   userhost,
-- os_process,
-- terminal,
   instance_number,
   object_schema,
   object_name,
-- policy_name,
-- new_owner,
-- new_name,
-- action,
   statement_type,
   audit_option,
-- transactionid,
   returncode,
-- scn,
   comment_text,
   sql_bind,
   obj_privilege,      -- Object privileges granted or revoked by a grant or revoke stmt.
   sys_privilege,      -- System privileges granted or revoked by a grant or revoke stmt.
   admin_option,
   os_privilege,
   grantee,
   ses_actions,
-- logoff_time,
-- logoff_lread,       -- Number of logical reads for the session 
-- logoff_pread,       -- Number of physical reads for the session
-- logoff_lwrite,      -- Number of logical writes for the session
-- logoff_dlock,       -- Number of deadlocks detected during the session
-- session_cpu,        -- Amount of CPU time used by the Oracle session
-- obj_edition_name,
   dbid
from
  dba_common_audit_trail
where
  os_user = 'rnyffenegger'
order by
  extended_timestamp desc;
