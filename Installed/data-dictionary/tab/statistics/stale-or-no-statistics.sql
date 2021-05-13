select
   tst.owner,
   tst.table_name,
   tst.last_analyzed,
   tst.object_type
from
   all_tab_statistics  tst    join
   all_users           usr on tst.owner = usr.username
where
 ( stale_stats is null or stale_stats = 'YES' ) and
   usr.oracle_maintained <> 'Y'                 and
   table_name not like 'BIN$%'
order by
   owner,
   table_name;
