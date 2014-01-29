create table tq84_not_null_non_unique (
  col_1     number,
  col_2     varchar2(10),
  col_3     varchar2(10),
  --
  constraint tq84_not_null_non_unique_uq unique (col_1, col_2)
);


insert into tq84_not_null_non_unique values (   1, 'one' , 'uno'   );
insert into tq84_not_null_non_unique values (null, 'null', 'niente');
insert into tq84_not_null_non_unique values (   0,  null , 'niente');
insert into tq84_not_null_non_unique values (   1,  null , 'foo'   );
insert into tq84_not_null_non_unique values (null, 'NULL', 'bar'   );
insert into tq84_not_null_non_unique values (null,  null , 'baz'   );
insert into tq84_not_null_non_unique values (null,  null , 'baz 2' );



drop table tq84_not_null_non_unique purge;
