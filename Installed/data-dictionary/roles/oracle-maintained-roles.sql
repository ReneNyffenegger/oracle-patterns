select
  lower(role)
from
  dba_roles
where
  oracle_maintained='Y'
order by
  lower(role);
--
-- adm_parallel_execute_task
-- apex_administrator_role
-- apex_grants_for_new_users_role
-- aq_administrator_role
-- aq_user_role
-- audit_admin
-- audit_viewer
-- authenticateduser
-- capture_admin
-- cdb_dba
-- connect
-- datapump_exp_full_database
-- datapump_imp_full_database
-- dba
-- dbfs_role
-- delete_catalog_role
-- em_express_all
-- em_express_basic
-- execute_catalog_role
-- exp_full_database
-- gather_system_statistics
-- gds_catalog_select
-- global_aq_user_role
-- gsmadmin_role
-- gsm_pooladmin_role
-- gsmuser_role
-- hs_admin_execute_role
-- hs_admin_role
-- hs_admin_select_role
-- imp_full_database
-- logstdby_administrator
-- oem_advisor
-- oem_monitor
-- optimizer_processing_rate
-- pdb_dba
-- provisioner
-- recovery_catalog_owner
-- recovery_catalog_user
-- resource
-- scheduler_admin
-- select_catalog_role
-- wm_admin_role
-- xdbadmin
-- xdb_set_invoker
-- xdb_webservices
-- xdb_webservices_over_http
-- xdb_webservices_with_public
-- xs_cache_admin
-- xs_namespace_admin
-- xs_resource
-- xs_session_admin
