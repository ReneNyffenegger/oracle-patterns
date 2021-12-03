select
   spm.starts,
   lpad(' ', spm.plan_depth * 2, ' ') || spm.plan_operation,
   spm.plan_options,
   spm.plan_object_owner,
   spm.plan_object_name,
   spm.output_rows,
   spm.physical_read_requests,
   spm.physical_read_bytes,
   spm.physical_write_requests,
   spm.physical_write_bytes,
   spm.workarea_mem,
   spm.workarea_max_mem,
   spm.plan_cost,
   spm.plan_bytes,
   spm.plan_time
-- spm.*
from
   v$sql_plan_monitor spm
where
   spm.key = 463856468142
order by
   spm.plan_line_id;
