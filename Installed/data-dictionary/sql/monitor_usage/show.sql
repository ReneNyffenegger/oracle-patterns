select
  num_db_reports,
  num_em_reports,
  first_db_report_time,
  last_db_report_time,
  first_em_report_time,
  last_em_report_time
from
  dba_sql_monitor_usage
order by
  first_db_report_time;
