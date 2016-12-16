select
  *
from
  dba_objects obj
where
(
  obj.owner not in ('SYS', 'PUBLIC') and
  obj.object_type not in ('INDEX')
) and
(
  obj.object_name like 'XX%'     or 
 (obj.object_name like '%TRY'    and obj.object_name not like '%ENTRY') or
  obj.object_name like 'TMP%'    or
  obj.object_name like 'ABC'     or
  obj.object_name like 'TEST%'   or
  obj.object_name like 'DROP%'   or
  obj.object_name like '%OLD'    or
  obj.object_name like '%COPY'   or
  obj.object_name like '%BKP'    or
  regexp_like(obj.object_name, '_$')
)
order by
  obj.created;
