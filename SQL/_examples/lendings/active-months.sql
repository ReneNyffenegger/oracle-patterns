select
   whom,
   add_months(trunc(date_, 'mm'), 1) month_,
   sum (
     sum(case when period = 'start' then 1 else -1 end * value_)
   )
   over (
      partition by whom
      order by add_months(trunc(date_, 'mm'), 1)
   )  lent_value
from
   tq84_lendings unpivot (
      date_  for period in (
         start_ as 'start',
         end_   as 'end'
   )
)
group by
   whom,
   trunc(date_, 'mm')
order by
   whom,
   trunc(date_, 'mm')
;
-- WHOM       MONTH_     LENT_VALUE
-- ---------- ---------- ----------
-- Maria      2021-07-01         14
-- Maria      2021-10-01          0
-- Peter      2021-05-01          4
-- Peter      2021-06-01         26
-- Peter      2021-10-01         33
-- Peter      2021-11-01         31
-- Peter      2021-12-01          0
