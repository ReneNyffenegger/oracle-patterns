select
   whom,
   period,
   what,
   date_,
   case when period = 'start' then value_ end value_lent,
   case when period = 'end'   then value_ end value_back
from
   tq84_lendings unpivot (
      date_  for period in (
         start_ as 'start',
         end_   as 'end'
   )
)
order by
   whom,
   date_
;
--
-- WHOM       PERIO WHAT  DATE_      VALUE_LENT VALUE_BACK
-- ---------- ----- ----- ---------- ---------- ----------
-- Maria      start ZZZ   2021-06-22         14
-- Maria      end   ZZZ   2021-09-12                    14
-- Peter      start AAA   2021-04-14          4
-- Peter      start BBB   2021-05-12         22
-- Peter      start CCC   2021-09-07          7
-- Peter      end   AAA   2021-10-04                     4
-- Peter      start EEE   2021-10-16          9
-- Peter      end   CCC   2021-10-18                     7
-- Peter      end   BBB   2021-11-02                    22
-- Peter      end   EEE   2021-11-15                     9
