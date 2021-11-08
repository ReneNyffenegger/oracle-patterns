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
pivot (
   max(val_1) for
     (col_1, col_2) in (
       ('A', 'X') as ax,
       ('B', 'Y')
       ('C', 'Z')
    )
);
--
-- COL_3         AX    'B'_'Y'    'C'_'Z'
-- ----- ---------- ---------- ----------
-- v              9          7
-- w                         4          6
