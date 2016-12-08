create table tq84_row_archival (
  col_1 number,
  col_2 varchar2(10)
) row archival;


desc tq84_row_archival;

column column_name format a20
column data_type   format a20
select
  column_id,
  column_name,
  data_type,
  hidden_column
from
  user_tab_cols
where
  table_name = 'TQ84_ROW_ARCHIVAL';
-- 
--  COLUMN_ID COLUMN_NAME          DATA_TYPE            HID
-- ---------- -------------------- -------------------- ---
--            ORA_ARCHIVE_STATE    VARCHAR2             YES
--          1 COL_1                NUMBER               NO
--          2 COL_2                VARCHAR2             NO



insert into tq84_row_archival values ( 1, 'one'  );
insert into tq84_row_archival values ( 2, 'two'  );
insert into tq84_row_archival values ( 3, 'three');
insert into tq84_row_archival values ( 4, 'four' );
insert into tq84_row_archival values ( 5, 'five' );

update tq84_row_archival set ora_archive_state = 1 where col_2 like 't%';

select * from tq84_row_archival;
-- 
--      COL_1 COL_2
-- ---------- ----------
--          1 one
--          4 four
--          5 five

alter session set row archival visibility = all;

select * from tq84_row_archival;
-- 
--      COL_1 COL_2
-- ---------- ----------
--          1 one
--          2 two
--          3 three
--          4 four
--          5 five


drop table tq84_row_archival;
