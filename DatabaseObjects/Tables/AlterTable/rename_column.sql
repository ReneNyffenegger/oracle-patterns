create table tq84_table (
  col_1 number,
  col_2 date
);

insert into tq84_table values (1, sysdate);

alter table tq84_table rename column col_1 to nm;
alter table tq84_table rename column col_2 to dt;

desc tq84_table;

select * from tq84_table;

drop table tq84_table purge;
