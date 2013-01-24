--
--     Archives a portion of fga_log$ into fga_log_archive
--     and then purges the archived portion from fga_log$.
--
--     The idea is to call this script repeatedly.
--
--     Init needs to have been called once.
--

insert into rene.fga_log_archive
select 
  sessionid,
--dbuid,
  osuid,
  oshst,
  clientid,
--extid,
  obj$schema,
  obj$name,
  policyname,
--scn,
  sqltext,
--lsqltext,
--sqlbind,
--comment$text,
--plhol,
  stmt_type,
  ntimestamp#,
--proxy$sid,
--user$guid,
--instance#,
--process#,
--xid,
--auditid,
  statement,
--entryid,
--dbid,
--lsqlbind,
  obj$edition
from
  sys.fga_log$;


begin

  sys.dbms_audit_mgmt.set_last_archive_timestamp(
     audit_trail_type     => sys.dbms_audit_mgmt.audit_trail_fga_std,
     last_archive_time    => systimestamp
  );

  sys.dbms_audit_mgmt.clean_audit_trail(
   audit_trail_type        => sys.dbms_audit_mgmt.audit_trail_fga_std,
   use_last_arch_timestamp => true
  );

end;
/
