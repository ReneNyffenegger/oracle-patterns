select
   tsk.execution_start,
   tsk.execution_end,
-- fin.finding_id,
   fin.finding_name,
   fin.type,
-- fin.type_id,
   fin.message,
   fin.impact_type,
   fin.impact,
   fin.parent,
   fin.object_id,
   tsk.fdg_count,
   tsk.recommendation_count
-- fin.task_id,
-- fin.task_name,
from
   dba_addm_findings fin join
   dba_addm_tasks    tsk on fin.task_id = tsk.task_id
order by
   tsk.execution_start desc,
   fin.type_id, -- 1: Problem, 2 Symptom, 4: Information
   fin.finding_id;
