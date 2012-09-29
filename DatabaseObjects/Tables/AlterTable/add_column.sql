create table tq84_table (
  col_1 number,
  col_2 date
);

desc tq84_table;

insert into tq84_table values (1, sysdate);

alter table tq84_table add ( col_3 varchar2(10));
alter table tq84_table add ( col_4 number, col_5 number);
alter table tq84_table add ( col_6 number default 7);

desc tq84_table;

select * from tq84_table;

drop table tq84_table purge;
