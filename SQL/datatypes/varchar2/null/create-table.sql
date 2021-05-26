create table tq84_null_test (
    text_1   varchar2(20),
    text_2   varchar2(20)
);

insert into tq84_null_test values ('hello', 'world'         );
insert into tq84_null_test values (null   , 'other is null' );
insert into tq84_null_test values (''     , 'other is empty');

commit;
