select
  num,
  txt,
  lng
from (
  select
    t.*,
    row_number() over (order by num) r
  from
    top_n_test t
)
where
  r between 4 and 6;
