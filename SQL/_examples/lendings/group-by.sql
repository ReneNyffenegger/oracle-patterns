select
   whom,
   period,
   add_months(trunc(date_, 'mm'), 1) month_,
   sum(value_)                       sum_value
from
   tq84_lendings unpivot (
      date_  for period in (
         start_ as 'start',
         end_   as 'end'
   )
)
group by
   whom,
   period,
   trunc(date_, 'mm')
order by
   whom,
   trunc(date_, 'mm')
;
--
-- WHOM       PERIO MONTH_      SUM_VALUE
-- ---------- ----- ---------- ----------
-- Maria      start 2021-07-01         14
-- Maria      end   2021-10-01         14
-- Peter      start 2021-05-01          4
-- Peter      start 2021-06-01         22
-- Peter      start 2021-10-01          7
-- Peter      end   2021-11-01         11
-- Peter      start 2021-11-01          9
-- Peter      end   2021-12-01         31
