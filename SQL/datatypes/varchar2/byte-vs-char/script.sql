create table tq84_varchar2_byte_vs_char (
   col_10_bytes varchar2(10 byte),
   col_10_chars varchar2(10 char)
);

select
   substrb(column_name, 1, 15) col_name,
   substrb(data_type  , 1, 10) data_type,
   char_used,
   data_length
from
   user_tab_columns
where
   table_name = 'TQ84_VARCHAR2_BYTE_VS_CHAR';
-
-- COL_NAME        DATA_TYPE  C DATA_LENGTH
-- --------------- ---------- - -----------
-- COL_10_BYTES    VARCHAR2   B          10
-- COL_10_CHARS    VARCHAR2   C          40


alter session set nls_length_semantics = byte;
create table tq84_nls_byte (
   col varchar2(10)
);

alter session set nls_length_semantics = char;
create table tq84_nls_char (
   col varchar2(10)
);

select
   substrb(table_name, 1, 15) tab_name,
   substrb(data_type , 1, 10) data_type,
   char_used,
   data_length
from
   user_tab_columns
where
   table_name in (
      'TQ84_NLS_CHAR',
      'TQ84_NLS_BYTE'
   );
--
-- TAB_NAME        DATA_TYPE  C DATA_LENGTH
-- --------------- ---------- - -----------
-- TQ84_NLS_BYTE   VARCHAR2   B          10
-- TQ84_NLS_CHAR   VARCHAR2   C          40


drop table tq84_varchar2_byte_vs_char;
drop table tq84_nls_byte;
drop table tq84_nls_char;
