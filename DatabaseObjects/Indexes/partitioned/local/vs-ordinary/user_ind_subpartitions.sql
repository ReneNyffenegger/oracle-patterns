select
   index_name,
   partition_name,
   subpartition_name,
   global_stats,
   status
from
   user_ind_subpartitions
where
   index_name in ('TQ84_PART_LOCAL_IX', 'TQ84_PART_GLOBAL_IX');
