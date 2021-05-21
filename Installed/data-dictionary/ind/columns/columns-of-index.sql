select
   ico.index_owner,
   ico.table_name,
   ico.index_name,
   max(case when ico.column_position =  1 then ico.column_name end) col_01,
   max(case when ico.column_position =  2 then ico.column_name end) col_02,
   max(case when ico.column_position =  3 then ico.column_name end) col_03,
   max(case when ico.column_position =  4 then ico.column_name end) col_04,
   max(case when ico.column_position =  5 then ico.column_name end) col_05,
   max(case when ico.column_position =  6 then ico.column_name end) col_06,
   max(case when ico.column_position =  7 then ico.column_name end) col_07,
   max(case when ico.column_position =  8 then ico.column_name end) col_08,
   max(case when ico.column_position =  9 then ico.column_name end) col_09,
   max(case when ico.column_position = 10 then ico.column_name end) col_10
from
   all_ind_columns ico
-- where
--    ico.index_owner = user andj
--    ico.table_name  = ..
group by
   ico.index_owner,
   ico.table_name,
   ico.index_name
;
