select
   index_name,
   partitioned,
   status
from
   user_indexes
where
   index_name in ('TQ84_PART_LOCAL_IX', 'TQ84_PART_GLOBAL_IX');
