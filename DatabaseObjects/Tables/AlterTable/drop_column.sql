create table tq84_table (
  col_1 number,
  col_2 date,
  col_3 varchar2(10),
  col_4 varchar2(10)
);

insert into tq84_table values (1, sysdate, 'x', 'y');

alter table tq84_table drop column col_1;
alter table tq84_table drop (col_2, col_3);

desc tq84_table;

select * from tq84_table;

drop table tq84_table purge;
