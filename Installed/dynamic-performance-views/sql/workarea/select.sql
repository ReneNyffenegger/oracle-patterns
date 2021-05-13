select
   ses.sid,
   ses.serial#,
   lpad(' ', pln.depth * 2) || pln.operation   pln_operation,
   pln.options                                 pln_options,
   wra.operation_type,
   wra.policy,
   wra.estimated_optimal_size,
   wra.estimated_onepass_size,
   wra.last_memory_used,
   wra.last_execution,
   wra.last_degree,
   wra.total_executions,
   wra.optimal_executions,
   wra.onepass_executions,
   wra.multipasses_executions,
   wra.active_time,
   wra.max_tempseg_size,
   pln.cost,
   pln.cpu_cost,
   pln.io_cost,
   pln.time,
   pln.bytes,
   pln.object_node,
-- pln.object#
   pln.object_owner,
   pln.object_name,
   pln.object_type,
   pln.object_alias,
   pln.search_columns,
   pln.projection,
   pln.access_predicates,
   pln.filter_predicates,
   pln.id,
   pln.parent_id
from
   v$session      ses                                                     join
   v$sql_plan     pln on ses.sql_id           = pln.sql_id       and
                         ses.sql_child_number = pln.child_number     left join
   v$sql_workarea wra on pln.sql_id           = wra.sql_id       and
                         pln.child_number     = wra.child_number and
                         pln.id               = wra.operation_id
where
   ses.sid = sys_context('userenv', 'sid')
-- ses.osuser       = 'Rene'
-- ses.taddr is not null
-- pln.sql_id       = '8sgwz9ataxnt1' and
-- pln.child_number = 0
order by
   pln.id;
