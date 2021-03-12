select
-- ic.table_name,
   case when ic.column_position = 1 then ix.index_name         end index_name,
             ic.column_name,
   case when ic.column_position = 1 then ix.index_type         end index_type,
   case when ic.column_position = 1 then ix.table_type         end table_type,
   case when ic.column_position = 1 then iu.last_used          end last_used,
   case when ic.column_position = 1 then iu.total_access_count end total_access_count,
   ic.column_position
from
   dba_indexes      ix                                               join
   dba_ind_columns  ic on ix.owner      = ic.index_owner and
                          ix.index_name = ic.index_name         left join
   dba_index_usage  iu on ix.owner      = iu.owner       and
                          ix.index_name = iu.name
where
   ix.owner      = '...' and
   ix.table_name = '...'
order by
   ix.index_name,
   ic.column_position;
