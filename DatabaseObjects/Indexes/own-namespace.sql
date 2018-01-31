--
-- The name of an index is in a different namespace thant
-- the table. So, the following two statements
-- cause no error:
--

create table tq84_foo (a number, b number);
create index tq84_foo on tq84_foo(a);
