select
  lower(attribute_name)
from
  dba_scheduler_global_attribute
order by
  lower(attribute_name);
--
-- current_open_window
-- default_timezone
-- email_sender
-- email_server
-- email_server_credential
-- email_server_encryption
-- event_expiry_time
-- file_watcher_count
-- last_observed_event
-- log_history
-- max_job_slave_processes
