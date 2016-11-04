select
   owner,
   object_name,
   subobject_name,
-- object_id,
-- data_object_id,
   object_type,
   last_ddl_time,
   status,
   timestamp,
   temporary,
   generated,
   secondary,
   namespace,
   edition_name
from
  dba_invalid_objects
order by
  owner,
  object_name;
