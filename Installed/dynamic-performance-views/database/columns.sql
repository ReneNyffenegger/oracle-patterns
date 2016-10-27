select 
  inst_id,
  dbid,
  name                         db_name,
  db_unique_name,
  --
  log_mode,
  database_role,
  flashback_on,
  guard_status,
  created                      db_creation,
  --
  current_scn,
  checkpoint_change#           scn_last_checkpoint,
  resetlogs_change#            scn_resetlogs,
  prior_resetlogs_change#      scn_prior_resetlogs,
  archive_change#              scn_db_archiving,
  min_required_capture_change# scn_min_required_checkpoint,
  controlfile_change#          last_scn_in_backup_ctrl_file,
  --
  archivelog_change#           ,             -- Highest NEXT_CHANGE# (from the V$ARCHIVED_LOG view) for an archive log
  --
  resetlogs_time,
  prior_resetlogs_time,
  controlfile_time,
  version_time,
  --
  controlfile_type,
  controlfile_created,
  controlfile_sequence#,
  open_resetlogs,
  open_mode,
  protection_mode,
  protection_level,
  remote_archive,               -- compare init-parameter: remote_archive_enable 
  activation#,
  switchover#,
  database_role,
  archivelog_compression,
  switchover_status,
  dataguard_broker,
  supplemental_log_data_min,
  supplemental_log_data_pk,
  supplemental_log_data_ui,
  force_logging,
  --
  platform_id,
  platform_name,
  --
  recovery_target_incarnation#,
  last_open_incarnation#,
  supplemental_log_data_fk,
  supplemental_log_data_all,
  standby_became_primary_scn,
  --
  fs_failover_status,
  fs_failover_current_target,
  fs_failover_threshold,
  fs_failover_observer_present,
  fs_failover_observer_host,
  --
  controlfile_converted,
  primary_db_unique_name,
  supplemental_log_data_pl
from
  gv$database
order by
  inst_id;
  
