select
   object_type       ,
   index_name        ,
   partition_name    , subpartition_name
   partition_position, subpartition_position,
   num_rows,
   global_stats,
   last_analyzed,
   stale_stats
from
   user_ind_statistics
where
   table_name = 'TQ84_PART_IX_TEST';
