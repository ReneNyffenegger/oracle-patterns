select
   ico.index_owner,
   ico.table_name,
   ico.index_name,
   ind.uniqueness,
   max(case when ico.column_position =  1 then ico.column_name end) col_01, max(case when ico.column_position =  1 then col.nullable end) n_01,
   max(case when ico.column_position =  2 then ico.column_name end) col_02, max(case when ico.column_position =  2 then col.nullable end) n_02,
   max(case when ico.column_position =  3 then ico.column_name end) col_03, max(case when ico.column_position =  3 then col.nullable end) n_03,
   max(case when ico.column_position =  4 then ico.column_name end) col_04, max(case when ico.column_position =  4 then col.nullable end) n_04,
   max(case when ico.column_position =  5 then ico.column_name end) col_05, max(case when ico.column_position =  5 then col.nullable end) n_05,
   max(case when ico.column_position =  6 then ico.column_name end) col_06, max(case when ico.column_position =  6 then col.nullable end) n_06,
   max(case when ico.column_position =  7 then ico.column_name end) col_07, max(case when ico.column_position =  7 then col.nullable end) n_07,
   max(case when ico.column_position =  8 then ico.column_name end) col_08, max(case when ico.column_position =  8 then col.nullable end) n_08,
   max(case when ico.column_position =  9 then ico.column_name end) col_09, max(case when ico.column_position =  9 then col.nullable end) n_09,
   max(case when ico.column_position = 10 then ico.column_name end) col_10, max(case when ico.column_position = 10 then col.nullable end) n_10
from
   all_indexes     ind                                                     join
   all_ind_columns ico on ind.owner       = ico.index_owner and
                          ind.table_name  = ico.table_name  and
                          ind.index_name  = ico.index_name                 join
   all_tab_columns col on ico.index_owner = col.owner       and
                          ico.table_name  = col.table_name  and
                          ico.column_name = col.column_name
where
  ico.index_owner = 'RENE'           and
  ico.table_name  = 'TQ84_TTT'
group by
   ico.index_owner,
   ico.table_name,
   ico.index_name,
   ind.uniqueness
;
