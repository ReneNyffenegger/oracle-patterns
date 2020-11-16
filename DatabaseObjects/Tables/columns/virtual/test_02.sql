-- TODO tq84_virtual_test_pck defined in test_01.sql

create table tq84_virtual_test_2 (
       c1 number,
--     oh, oh, ORA-30553: The function is not deterministic:
--     f_ as (tq84_virtual_test_pck.f_non_deterministic(c1)),
       f_ as (tq84_virtual_test_pck.f_deterministic    (c1))
);

insert into tq84_virtual_test_2 (c1) values (  1);
insert into tq84_virtual_test_2 (c1) values ( 10);
insert into tq84_virtual_test_2 (c1) values (100);

select * from tq84_virtual_test_2;

drop table tq84_virtual_test_2;
drop package tq84_virtual_test_pck;
