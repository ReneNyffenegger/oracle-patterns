with x as (
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
   -- period,
      trunc(date_, 'mm')
),
-- select * from x
whoms as (
   select 
      whom,
                 min(month_)      month_min,
      add_months(max(month_), -1) month_max
    from
      x
    group by
      whom
),
months as (
   select
      add_months(date '2021-01-01', level) month_
   from dual
      connect by level <= 12
)
select
   whoms.whom,
   months.month_,
   nvl(
-- Fill null-values with previous non-null value.
--(https://renenyffenegger.ch/notes/development/databases/Oracle/SQL/select/analytic/lag-lead/fill-missing-values-with-previous-value)
      x.lent_value,
      lag(x.lent_value)
         ignore nulls
         over (
           partition by whoms.whom
           order by months.month_
         )
   )     as lent_value_nn
from
   whoms        join
   months       on  months.month_ between whoms.month_min and whoms.month_max
   left join
    x      on    x.whom   = whoms.whom and
                 x.month_ = months.month_
order by
   whoms.whom,
   months.month_
;
--
-- WHOM       MONTH_     LENT_VALUE_NN
-- ---------- ---------- -------------
-- Maria      2021-07-01            14
-- Maria      2021-08-01            14
-- Maria      2021-09-01            14
-- Peter      2021-05-01             4
-- Peter      2021-06-01            26
-- Peter      2021-07-01            26
-- Peter      2021-08-01            26
-- Peter      2021-09-01            26
-- Peter      2021-10-01            33
-- Peter      2021-11-01            31
