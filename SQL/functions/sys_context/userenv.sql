with name as (
   select 'action'                     space from dual union all
   select 'audited_cursorid'           space from dual union all
   select 'authenticated_identity'     space from dual union all
   select 'authentication_data'        space from dual union all
   select 'authentication_method'      space from dual union all
   select 'bg_job_id'                  space from dual union all
   select 'cdb_name'                   space from dual union all
   select 'client_identifier'          space from dual union all
   select 'client_info'                space from dual union all
   select 'client_program_name'        space from dual union all
   select 'con_id'                     space from dual union all
   select 'con_name'                   space from dual union all
-- select 'current_bind'               space from dual union all  -- Only within event handlers for fine-grained auditing
   select 'current_edition_name'       space from dual union all
   select 'current_schema'             space from dual union all
   select 'current_schemaid'           space from dual union all
-- select 'current_sql'                space from dual union all  -- Only within event handlers for fine-grained auditing
-- select 'current_sql_length'         space from dual union all  -- Only within event handlers for fine-grained auditing
   select 'current_user'               space from dual union all
   select 'current_userid'             space from dual union all
   select 'database_role'              space from dual union all
   select 'db_domain'                  space from dual union all
   select 'db_name'                    space from dual union all
   select 'db_supplemental_log_level'  space from dual union all
   select 'db_unique_name'             space from dual union all  -- Corresponds to init param with same name
   select 'dblink_info'                space from dual union all
   select 'entryid'                    space from dual union all
-- select 'enterprise_security'        space from dual union all
   select 'fg_job_id'                  space from dual union all
   select 'global_context_memory'      space from dual union all
   select 'global_uid'                 space from dual union all
   select 'host'                       space from dual union all
   select 'identification_type'        space from dual union all
   select 'instance'                   space from dual union all  -- Identifies an instance. Relevant in RAC environments. Also used in v$ views.
   select 'instance_name'              space from dual union all
   select 'ip_address'                 space from dual union all
-- select 'is_apply_server'            space from dual union all
   select 'is_dg_rolling_upgrade'      space from dual union all
   select 'isdba'                      space from dual union all
   select 'lang'                       space from dual union all
   select 'language'                   space from dual union all
   select 'network_protocol'           space from dual union all
   select 'nls_calendar'               space from dual union all
   select 'nls_currency'               space from dual union all
   select 'nls_date_format'            space from dual union all
   select 'nls_date_language'          space from dual union all
   select 'nls_sort'                   space from dual union all
   select 'nls_territory'              space from dual union all
   select 'oracle_home'                space from dual union all
   select 'os_user'                    space from dual union all
   select 'platform_slash'             space from dual union all -- Slash type used to separate files and directories in path names.
   select 'policy_invoker'             space from dual union all
   select 'proxy_enterprise_identity'  space from dual union all
   select 'proxy_user'                 space from dual union all
   select 'proxy_userid'               space from dual union all
-- select 'scheduler_jobs'             space from dual union all
   select 'server_host'                space from dual union all
   select 'service_name'               space from dual union all
   select 'session_edition_id'         space from dual union all
   select 'session_edition_name'       space from dual union all
   select 'session_user'               space from dual union all
   select 'sessionid'                  space from dual union all
   select 'statementid'                space from dual union all
   select 'system_data_visible'        space from dual union all
   select 'terminal'                   space from dual
-- select 'unified_session_id'         space from dual
)
select
   name.space, substr(sys_context('userenv', name.space, 50), 1, 50)
from
   name;
