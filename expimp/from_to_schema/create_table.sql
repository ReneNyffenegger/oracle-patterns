connect u1/u1

create table tq84_table_for_export (
  col_1 number,
  col_2 number
);

insert into tq84_table_for_export values (1,2);
insert into tq84_table_for_export values (2,3);

commit;
