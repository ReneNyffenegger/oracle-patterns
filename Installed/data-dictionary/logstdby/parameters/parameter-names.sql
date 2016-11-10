select
  lower(name)
from
  dba_logstdby_parameters
order by
  lower(name);
-- 
-- allow_transformation
-- apply_servers
-- event_log_dest
-- log_auto_delete
-- log_auto_del_retention_target
-- max_events_recorded
-- max_servers
-- max_sga
-- prepare_servers
-- preserve_commit_order
-- record_applied_ddl
-- record_skip_ddl
-- record_skip_errors
-- record_unsupported_operations
