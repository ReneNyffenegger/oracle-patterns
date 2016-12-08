--
--  Setting a special sql terminator because SQL*Plus is not
--  updated to 12c everywhere...
--
set sqlterminator "!"

create table tq84_inline_function (
  a number,
  b varchar2(10)
)!

insert into tq84_inline_function values ( 5, 'foo')!
insert into tq84_inline_function values ( 7, 'bar')!
insert into tq84_inline_function values ( 2, 'baz')!

with
  function fib(y number) return number as
  begin
     if y<=2 then return 1; end if;
     return fib(y-2) + fib(y-1);
  end fib;
select
  a, fib(a), b
from
  tq84_inline_function
!

drop table tq84_inline_function!
