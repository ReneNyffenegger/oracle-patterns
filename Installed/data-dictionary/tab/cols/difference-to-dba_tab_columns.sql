with
  c1 as (select * /* column_name, data_type, data_length, data_precision */ from dba_tab_cols    where owner = 'SYS' and table_name = 'DBA_TAB_COLS'   ),
  c2 as (select * /* column_name, data_type, data_length, data_precision */ from dba_tab_columns where owner = 'SYS' and table_name = 'DBA_TAB_COLUMNS')
select
  nvl(c1.column_name, c2.column_name) column_name,
  nvl(case when c1.column_name is null and c2.column_name is not null then 'only in dba_tab_columns' end,
      case when c2.column_name is null and c1.column_name is not null then 'only in dba_tab_cols'    end
  )  where_
--    c1.data_type  , c2.data_type,
--    c1.column_id  , c2.column_id
from
  c1 full outer join
  c2 on c1.column_name = c2.column_name
order by
  c1.column_id,
  c2.column_id;
--
-- OWNER
-- TABLE_NAME
-- COLUMN_NAME
-- DATA_TYPE
-- DATA_TYPE_MOD
-- DATA_TYPE_OWNER
-- DATA_LENGTH
-- DATA_PRECISION
-- DATA_SCALE
-- NULLABLE
-- COLUMN_ID
-- DEFAULT_LENGTH
-- DATA_DEFAULT
-- NUM_DISTINCT
-- LOW_VALUE
-- HIGH_VALUE
-- DENSITY
-- NUM_NULLS
-- NUM_BUCKETS
-- LAST_ANALYZED
-- SAMPLE_SIZE
-- CHARACTER_SET_NAME
-- CHAR_COL_DECL_LENGTH
-- GLOBAL_STATS
-- USER_STATS
-- AVG_COL_LEN
-- CHAR_LENGTH
-- CHAR_USED
-- V80_FMT_IMAGE
-- DATA_UPGRADED
-- HIDDEN_COLUMN        	 only in dba_tab_cols
-- VIRTUAL_COLUMN       	 only in dba_tab_cols
-- SEGMENT_COLUMN_ID    	 only in dba_tab_cols
-- INTERNAL_COLUMN_ID   	 only in dba_tab_cols
-- HISTOGRAM
-- QUALIFIED_COL_NAME   	 only in dba_tab_cols
