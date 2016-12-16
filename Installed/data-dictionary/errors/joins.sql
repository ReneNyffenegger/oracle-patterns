select
  to_char(obj.created, 'yyyy-mm-dd')  obj_created,
--err.message_number,
  err.name,
  err.type,
  err.line,
  substr(err.text, 1, 100) err_text,
  src.text
from
  dba_errors  err                                               join
  dba_objects obj on err.owner = obj.owner            and
                     err.name  = obj.object_name      and
                     err.type  = obj.object_type           left join
  dba_source  src on err.owner = src.owner            and
                     err.name  = src.name             and
                     err.type  = src.type             and
                     err.line  = src.line
where
  err.text    not in ('PL/SQL: SQL Statement ignored', 'PL/SQL Statement ignored')
order by
  obj.created
 ;
