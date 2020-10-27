select lower(name) name from 
(
   select
    -- 'SYS', 
      view_name name
   from
      v$fixed_view_definition
  where
      lower(view_definition) like '%sid%serial#%'
union all   
   select
   -- a.owner, -- Always 'SYS' (?)
      a.table_name
   from 
      all_tab_columns  a   join
      all_tab_columns  b on
         a.owner      = b.owner      and
         a.table_name = b.table_name
   where
      a.column_name = 'SID' and
      b.column_name = 'SERIAL#'
)      
order by
   replace(replace(name, 'GV$', 'V$'), 'V_$', 'V$')
;
