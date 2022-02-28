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

