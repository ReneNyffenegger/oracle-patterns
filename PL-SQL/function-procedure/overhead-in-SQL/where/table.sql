create table tq84_tab (
   nm number
);

insert into tq84_tab
select
   mod(
      a.n*13 +
      b.n*17 +
      c.n*19 ,
      100
   )
from
--
-- Prevent ORA-30009: Not enough memory for CONNECT BY operation
--   ( see http://nimishgarg.blogspot.com/2017/12/ora-30009-not-enough-memory-for-connect.html)
--
   (select level n from dual connect by level <= 1000) a,
   (select level n from dual connect by level <= 1000) b,
   (select level n from dual connect by level <=   50) c
;
