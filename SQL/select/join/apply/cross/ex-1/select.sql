select
   l.text,
   a.total
from
   tq84_left l cross apply
  (select
      sum(r.val) total
   from
      tq84_right r
   where
      r.id_left = l.id
  ) a;
--
-- foo	111.11
-- bar	222.22
-- baz	333.33
