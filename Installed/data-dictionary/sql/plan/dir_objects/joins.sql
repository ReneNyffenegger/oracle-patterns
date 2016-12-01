select
  obj.object_name,
  obj.subobject_name,
  dir.reason,
  dir.created,
  dir.type,
  obj.object_type
from
  dba_sql_plan_dir_objects obj   join
  dba_sql_plan_directives  dir on obj.directive_id = dir.directive_id
where
  obj.owner = 'RNYFFENEGGER'
order by
  dir.created desc;
