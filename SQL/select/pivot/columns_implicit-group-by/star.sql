select
   *
from
   tq84_pivot_test
   pivot ( max(val_1) for col_1 in ('A', 'B'))
;
--
--         ID COL_2 COL_3 VAL_2        'A'        'B'
-- ---------- ----- ----- ----- ---------- ----------
--          3 Y     v     three                     2
--          5 Y     v     five           5
--          4 Y     v     four                      7
--          8 Z     w     eight
--          2 X     v     two            9
--          7 Y     w     seven                     1
--          1 X     v     one            8
--          6 Y     w     six                       4
