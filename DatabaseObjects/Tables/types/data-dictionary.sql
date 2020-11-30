select
   obj.object_name,
   obj.object_type,
   obj.temporary,
-- tab.temporary,
   tab.duration,
   tab.iot_type,
   tab.tablespace_name
from
   user_objects obj    left join
   user_tables  tab on obj.object_name = tab.table_name
where
   substr(object_name, 1, 9) = 'TBL_TYPE_' or
   substr(object_name, 1, 8) = 'ORA$PTT_'      -- <== private temporary tables not shown in user_objects
;
