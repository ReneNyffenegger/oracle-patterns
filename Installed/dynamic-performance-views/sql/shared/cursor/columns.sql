select
   column_name
from
   dba_tab_columns d
where
   table_name = 'V_$SQL_SHARED_CURSOR'
order by
   case
      when column_name in ('SQL_ID', 'ADDRESS', 'CHILD_ADDRESS', 'CHILD_NUMBER', 'UNBOUND_CURSOR') then 'A' || to_char(column_id, '9990')
      when column_name in ('REASON'                                                              ) then 'B' || to_char(column_id, '9990')
   -- when column_name in ('USE_FEEDBACK_STATS'                                                  ) then 'C' || to_char(column_id, '9990')
      when column_name in ('CON_ID'                                                              ) then 'Z' || to_char(column_id, '9990')
      else                                                                                              'Y' || column_name
   end
;
