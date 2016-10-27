--
--    Find the name of a table given two of its attribute/column names.
--

create table tq84_foo (
  col_abc  number,
  col_cde  number,
  col_efg  number,
  col_hij  number
);

create table tq84_bar (
  col_abc  number,
  col_hij  number,
  col_klm  date
);

create table tq84_baz (
  col_abc  number,
  col_hij  number,
  col_nop  date
);


select
  a.owner,
  a.table_name
--a.column_name,
--b.column_name
from
  all_tab_columns  a                                 join
  all_tab_columns  b on a.owner      = b.owner and
                        a.table_name = b.table_name
where
  a.column_name  = 'COL_ABC' and
  b.column_name  = 'COL_KLM';


drop table tq84_baz purge;
drop table tq84_bar purge;
drop table tq84_foo purge;
