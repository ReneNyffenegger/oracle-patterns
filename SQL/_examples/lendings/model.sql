select
   whom,
   to_char(month_, 'yyyy mm') month_,
   lent_value
from (
   select
      whom,
--    what,
      add_months(trunc(date_, 'mm'), 1)                month_,
      sum (case when period = 'start' then value_ end) value_lent,
      sum (case when period = 'end'   then value_ end) value_back
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
)
model
   partition by (whom  )
   dimension by (month_)
   measures (
      value_lent,
      value_back,
      cast (null as number) lent_value
   )
   ignore nav
   rules sequential order (
      lent_value[
         for month_
             from      date '2021-01-01'
             to        date '2022-01-01'
             increment numtoyminterval(1, 'month')
      ] = sum(nvl(value_lent, 0) - nvl(value_back, 0))[month_ <= cv(month_)]
   )
order by
   whom,
   month_
;
--
-- WHOM       MONTH_  LENT_VALUE
-- ---------- ------- ----------
-- Maria      2021 01
-- Maria      2021 02          0
-- Maria      2021 03          0
-- Maria      2021 04          0
-- Maria      2021 05          0
-- Maria      2021 06          0
-- Maria      2021 07         14
-- Maria      2021 08         14
-- Maria      2021 09         14
-- Maria      2021 10          0
-- Maria      2021 11          0
-- Maria      2021 12          0
-- Maria      2022 01          0
-- Peter      2021 01
-- Peter      2021 02          0
-- Peter      2021 03          0
-- Peter      2021 04          0
-- Peter      2021 05          4
-- Peter      2021 06         26
-- Peter      2021 07         26
-- Peter      2021 08         26
-- Peter      2021 09         26
-- Peter      2021 10         33
-- Peter      2021 11         31
-- Peter      2021 12          0
-- Peter      2022 01          0
