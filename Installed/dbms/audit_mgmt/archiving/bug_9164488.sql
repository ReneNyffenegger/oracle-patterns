--
--   With bug 9164488, it is possible to use clean_audit_trail with 
--   the following workaround. No idea if it is endorsed by Oracle.
--   
--   See http://dba.stackexchange.com/questions/33250/archiving-fga-log-sys-dbms-audit-mgmt-clean-audit-trail-doesnt-delete-anythin
--

begin

  sys.dbms_audit_mgmt.create_purge_job (
     audit_trail_type           => sys.dbms_audit_mgmt.audit_trail_fga_std,
     audit_trail_purge_interval => 999,
     audit_trail_purge_name     =>'Purge_Test',
     use_last_arch_timestamp    => true
  );

end;
/
