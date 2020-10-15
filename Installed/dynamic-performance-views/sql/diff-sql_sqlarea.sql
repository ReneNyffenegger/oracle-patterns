with
   a as (select column_name from all_tab_columns where table_name = 'V_$SQL'     and owner = 'SYS'),
   b as (select column_name from all_tab_columns where table_name = 'V_$SQLAREA' and owner = 'SYS')
select
   substrb(a.column_name, 1, 30) col_sql,
   substrb(b.column_name, 1, 30) col_sqlarea
from
   a full outer join b on a.column_name = b.column_name
where
   a.column_name is null or
   b.column_name is null
order by
   coalesce(a.column_name, b.column_name);

--
-- COL_SQL                        COL_SQLAREA
-- ------------------------------ ------------------------------
-- AVOIDED_EXECUTIONS
-- CHILD_ADDRESS
-- CHILD_NUMBER
-- DDL_NO_INVALIDATE
-- IM_SCANS
-- IM_SCAN_BYTES_INMEMORY
-- IM_SCAN_BYTES_UNCOMPRESSED
-- IS_ROLLING_INVALID
-- IS_ROLLING_REFRESH_INVALID
-- IS_SHAREABLE
--                                LAST_ACTIVE_CHILD_ADDRESS
-- RESULT_CACHE
-- SERVICE
-- SERVICE_HASH
-- SQLTYPE
-- SQL_QUARANTINE
-- TYPE_CHK_HEAP
--                                VERSION_COUNT
