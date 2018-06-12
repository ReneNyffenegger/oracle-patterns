select
-- ic.table_name,
   case when ic.column_position = 1 then ix.index_name else '' end index_name,
   ic.column_name,
   ix.index_type,
   ix.table_type,
   ic.column_position
from
   dba_indexes      ix  join
   dba_ind_columns  ic on ix.owner      = ic.index_owner and
                          ix.index_name = ic.index_name
where
   ix.owner      = 'K' and
   ix.table_name = 'BALSTRU_SERPIL'
order by
   ix.index_name,
   ic.column_position;
