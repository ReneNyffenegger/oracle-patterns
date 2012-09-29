create table tq84_virtual_test (
       c1        number,
       c2        number,
       ------------
       addition       as (c1+c2),
       subtraction    as (c1-c2),
       multiplication as (c1*c2),
       division       as (c1/c2)
);

create or replace package tq84_virtual_test_pck as

          function f_non_deterministic (c1_ in number) return number;
          function f_deterministic     (c1_ in number) return number deterministic;

end tq84_virtual_test_pck;
/

create or replace package body tq84_virtual_test_pck as

          function f_non_deterministic (c1_ in number) return number as
          begin
              return dbms_random.value(0, c1_);
          end f_non_deterministic;

          function f_deterministic (c1_ in number) return number deterministic as
          begin
              return c1_ * 42;
          end f_deterministic;

end tq84_virtual_test_pck;
/


insert into tq84_virtual_test          values (18, 13, default, default, default, default);
insert into tq84_virtual_test (c1, c2) values ( 2, 42);
insert into tq84_virtual_test (c1, c2) values (13, null);
insert into tq84_virtual_test (c1, c2) values (14,   0);
commit;

select c1, c2, addition, subtraction, multiplication           from tq84_virtual_test;

select c1, c2, addition, subtraction, multiplication, division from tq84_virtual_test where c2 is null or c2 != 0;

--   oh, oh, ORA-01476: divisor is equal to zero
select * from tq84_virtual_test;

select c1, c2, addition, subtraction, multiplication, case when c2 = 0 then null else division end division from tq84_virtual_test;

drop table tq84_virtual_test;
