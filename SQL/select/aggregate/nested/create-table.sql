create table tq84_nested_aggr_func_test (
   val_1  varchar2(5),
   val_2  number
);

insert into tq84_nested_aggr_func_test values ('ABC',  1);
insert into tq84_nested_aggr_func_test values ('ABC',  2);
insert into tq84_nested_aggr_func_test values ('ABC',  3);

insert into tq84_nested_aggr_func_test values ('DEF',  6);
insert into tq84_nested_aggr_func_test values ('DEF',  8);

insert into tq84_nested_aggr_func_test values ('GHI', 10);

commit;
