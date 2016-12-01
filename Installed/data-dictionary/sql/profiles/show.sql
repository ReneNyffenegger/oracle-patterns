select
  name,
  category,
  created,
  last_modified,
  description,
  type,
  task_id,
  task_exec_name,
--task_obj_id,
--task_fnd_id,
--task_rec_id,
--task_con_dbid,
  sql_text,
  signature,
  status
from
  dba_sql_profiles
order by
  status,
  created desc;
