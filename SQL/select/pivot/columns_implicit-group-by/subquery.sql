select
   *
from (
   select
      col_1,
      col_2,
      col_3,
      val_1
   from
      tq84_pivot_test
)
pivot ( max(val_1) for col_1 in ('A', 'B')) ;
--
-- COL_2 COL_3        'A'        'B'
-- ----- ----- ---------- ----------
-- Y     w                         4
-- Z     w
-- Y     v              5          7
-- X     v              9
