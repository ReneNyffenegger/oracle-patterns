--
--  This script counts different object types per user/schema.
--
select
   u.username,
   sum(case when o.object_type = 'TABLE'               then 1 else 0 end)    cnt_table,
   sum(case when o.object_type = 'TABLE PARTITION'     then 1 else 0 end)    cnt_table_partition,
   sum(case when o.object_type = 'TABLE SUBPARTITION'  then 1 else 0 end)    cnt_table_subpartition,
   sum(case when o.object_type = 'VIEW'                then 1 else 0 end)    cnt_view,
   sum(case when o.object_type = 'INDEX'               then 1 else 0 end)    cnt_index,
   sum(case when o.object_type = 'INDEX PARTITION'     then 1 else 0 end)    cnt_index_partition,
   sum(case when o.object_type = 'INDEX SUBPARTITION'  then 1 else 0 end)    cnt_index_subpartition,
   sum(case when o.object_type = 'PACKAGE'             then 1 else 0 end)    cnt_package,
   sum(case when o.object_type = 'PACKAGE BODY'        then 1 else 0 end)    cnt_package_body,
   sum(case when o.object_type = 'FUNCTION'            then 1 else 0 end)    cnt_function,
   sum(case when o.object_type = 'PROCEDURE'           then 1 else 0 end)    cnt_procedure,
   sum(case when o.object_type = 'TRIGGER'             then 1 else 0 end)    cnt_trigger,
   sum(case when o.object_type = 'TYPE'                then 1 else 0 end)    cnt_type,
   sum(case when o.object_type = 'TYPE BODY'           then 1 else 0 end)    cnt_type_body,
   sum(case when o.object_type = 'SEQUENCE'            then 1 else 0 end)    cnt_sequence,
   sum(case when o.object_type = 'SYNONYM'             then 1 else 0 end)    cnt_synonym,
   sum(case when o.object_type = 'LOB'                 then 1 else 0 end)    cnt_lob,
   sum(case when o.object_type = 'LOB PARTITION'       then 1 else 0 end)    cnt_lob_partition,
   sum(case when o.object_type = 'JOB'                 then 1 else 0 end)    cnt_job,
   sum(case when o.object_type = 'RULE'                then 1 else 0 end)    cnt_rule,
   sum(case when o.object_type = 'SCHEDULE'            then 1 else 0 end)    cnt_schedule,
   sum(case when o.object_type = 'WINDOW'              then 1 else 0 end)    cnt_window,
   sum(case when o.object_type = 'LIBRARY'             then 1 else 0 end)    cnt_library,
   sum(case when o.object_type = 'PROGRAM'             then 1 else 0 end)    cnt_program,
   sum(case when o.object_type = 'MATERIALIZED VIEW'   then 1 else 0 end)    cnt_materialized_view,
   sum(case when o.object_type = 'DATABASE LINK'       then 1 else 0 end)    cnt_database_link,
   sum(case when o.object_type = 'CLUSTER'             then 1 else 0 end)    cnt_cluster,
   sum(case when o.object_type = 'QUEUE'               then 1 else 0 end)    cnt_queue,
   sum(case when o.object_type = 'CONSUMER GROUP'      then 1 else 0 end)    cnt_consumer_group,
   sum(case when o.object_type = 'EVALUATION CONTEXT'  then 1 else 0 end)    cnt_evaluation_context,
   sum(case when o.object_type = 'RULE SET'            then 1 else 0 end)    cnt_rule_set,
   sum(case when o.object_type = 'SCHEDULER GROUP'     then 1 else 0 end)    cnt_scheduler_group,
   sum(case when o.object_type = 'DIRECTORY'           then 1 else 0 end)    cnt_directory,
   sum(case when o.object_type = 'INDEXTYPE'           then 1 else 0 end)    cnt_indextype,
   sum(case when o.object_type = 'UNDEFINED'           then 1 else 0 end)    cnt_undefined,
   sum(case when o.object_type = 'OPERATOR'            then 1 else 0 end)    cnt_operator,
   sum(case when o.object_type = 'EDITION'             then 1 else 0 end)    cnt_edition,
   sum(case when o.object_type = 'RESOURCE PLAN'       then 1 else 0 end)    cnt_resource_plan,
   sum(case when o.object_type = 'CONTEXT'             then 1 else 0 end)    cnt_context,
   sum(case when o.object_type = 'XML SCHEMA'          then 1 else 0 end)    cnt_xml_schema,
   sum(case when o.object_type = 'DESTINATION'         then 1 else 0 end)    cnt_destination,
   sum(case when o.object_type = 'JOB CLASS'           then 1 else 0 end)    cnt_job_class 
from
   dba_users   u   left join
   dba_objects o on u.username = o.owner
where
-- Default Oracle users:
   username not in ('APPQOSSYS', 'AUDITVAULT', 'SYSTEM', 'SYS', 'OUTLN', 'DIP', 'DBSNMP', 'ORACLE_OCM', 'ZKBMON', 'XS$NULL', 'XDB', 'ANONYMOUS', 'WMSYS')
group by
   u.username
order by
   2 desc;

