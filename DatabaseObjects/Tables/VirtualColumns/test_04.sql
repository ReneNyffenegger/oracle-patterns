create table tq84_virtual_test_4 (
       c1    number
);

insert into tq84_virtual_test_4 (c1) values (1);
insert into tq84_virtual_test_4 (c1) values (2);
insert into tq84_virtual_test_4 (c1) values (3);
insert into tq84_virtual_test_4 (c1) values (4);
commit;

create or replace package tq84_virtual_test_pck_4 as

       function r(c1_ in number) return number deterministic;

end tq84_virtual_test_pck_4;
/

create or replace package body tq84_virtual_test_pck_4 as

       function r(c1_ in number) return number deterministic is
           v number;
       begin

           select sum(c1) 
             into v 
             from tq84_virtual_test_4
            where c1 != c1_;

          return v;

       end r;

end tq84_virtual_test_pck_4;
/

alter table tq84_virtual_test_4 add (c2 as (tq84_virtual_test_pck_4.r(c1)));

drop table tq84_virtual_test_4;
drop package tq84_virtual_test_pck_4;
