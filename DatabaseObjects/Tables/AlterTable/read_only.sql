create table tq84_table (
  col_1 number,
  col_2 date
);

insert into tq84_table values (1, sysdate);

alter table tq84_table read only;

-- ORA-12081: update operation not allowed on table:
insert into tq84_table values (2, null);

drop table tq84_table purge;
