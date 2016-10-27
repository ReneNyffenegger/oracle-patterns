select 
  ft.name,
  ic.column_name
from
  v$fixed_table            ft                                 join
  v$indexed_fixed_column   ic on ft.name = ic.table_name
order by
  ft.name,
  ic.index_number;
