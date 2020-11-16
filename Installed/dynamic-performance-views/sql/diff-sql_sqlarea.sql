with
   a as (select column_name from dba_tab_columns where table_name = 'V_$SQL'     and owner = 'SYS'),
   b as (select column_name from dba_tab_columns where table_name = 'V_$SQLAREA' and owner = 'SYS')
select
   coalesce(a.column_name, b.column_name)            col_name,
   case when a.column_name is not null then 'y' end  in_v$sql,
   case when b.column_name is not null then 'y' end  in_v$sqlarea
from
   a full outer join b on a.column_name = b.column_name
order by
   coalesce(a.column_name, b.column_name)
