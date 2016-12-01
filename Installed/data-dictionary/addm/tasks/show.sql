select
  owner,
--advisor_id,
  advisor_name,  
  active_sessions,       -- Avg active sessions during analysis period
  task_id,
  parent_task_id,
  parent_rxec_id,
  task_name,
  recommendation_count,
  fdg_count,             -- Number of findings for ADDM tasks, appears in list of findings in default ADDM report
  execution_start,
  execution_end,
  begin_snap_id,
  end_snap_id,
  begin_time,
  end_time,
--meter_level,           -- Reserved for future use
  requested_analysis,
--pct_completion_time,
--progress_metric,
--metric_units,
--activity_counter,
  error_message,
  source,
  how_created,
  read_only,
  system_task,
  status,
--status#,
--status_message,
  last_execution
  description,
  execution_type,
  execution_type#,
  execution_description,
  created,
  last_modified,
  dbid,
  dbname,
  dbversion,
  analysis_version,
  database_time
from
  dba_addm_tasks
order by
  owner,
  execution_start desc
;
