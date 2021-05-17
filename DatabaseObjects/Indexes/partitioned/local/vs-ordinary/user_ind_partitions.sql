select
   index_name,
   partition_name,
   global_stats,
   composite,
   status
from
   user_ind_partitions
where
   index_name in ('TQ84_PART_LOCAL_IX', 'TQ84_PART_GLOBAL_IX');
