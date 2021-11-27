with numbers as (
   select  12345.6789 num from dual union all
   select - 7777.77   num from dual union all
   select      0.5    num from dual union all
   select      0.05   num from dual union all
   select     -0.05   num from dual union all
   select     -0.005  num from dual union all
   select      3.05   num from dual union all
   select      3.005  num from dual union all
   select     -3.005  num from dual union all
   select     -3.04   num from dual union all
   select     -3.05   num from dual union all
   select     -3.06   num from dual union all
   select      4.04   num from dual union all
   select      4.05   num from dual union all
   select      4.06   num from dual union all
   select      4.005  num from dual union all
   select     -4.05   num from dual union all
   select     -4.005  num from dual
)
select
         num    ,

   trunc(num   ), round(num   ), round_ties_to_even(num   ),
   trunc(num, 2), round(num, 2), round_ties_to_even(num, 2),
   trunc(num,-2), round(num,-2), round_ties_to_even(num,-2),

   ceil (num   ),
   floor(num   )
from
   numbers;
