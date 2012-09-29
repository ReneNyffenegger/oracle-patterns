create table tq84_table (
  col_1 number,
  col_2 date,
  col_3 varchar2(10),
  col_4 varchar2(10)
);


alter table tq84_table set unused (col_2, col_3);

desc tq84_table;

select table_name, count from user_unused_col_tabs where table_name = 'TQ84_TABLE';

alter table tq84_table drop unused columns /* checkpoint 1000000 */ ;

select * from user_unused_col_tabs where table_name = 'TQ84_TABLE';

drop table tq84_table purge;
