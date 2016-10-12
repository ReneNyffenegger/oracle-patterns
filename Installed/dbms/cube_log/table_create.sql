--
-- Create table cube_build_log (See default_name.sql)
--
exec dbms_cube_log.table_create(dbms_cube_log.type_build)


select
  object_type,
  sysdate - created
from
  user_objects where object_name = 'CUBE_BUILD_LOG';


desc cube_build_log
