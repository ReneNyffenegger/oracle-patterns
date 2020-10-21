select
-- sqp.id,
-- sqp.parent_id,
   lpad('| ', (sqp.depth-1) * 2, '| ') || sqp.operation || case when sqp.options is not null then ' (' || sqp.options || ')' end op,
-- sqp.options,
   sqp.object_owner,
   sqp.position,
   sqp.object_name,
   sqp.projection,
   sqp.object_alias,
   sqp.qblock_name,
   sqp.access_predicates,
   sqp.filter_predicates,
   sqp.object_type,
   sqp.plan_hash_value
-- sqp.*
from
   v$sql_plan sqp
where
   sqp.sql_id       = '808j9a4rqjc9t' and
   sqp.child_number =  0
order by
   sqp.id;
