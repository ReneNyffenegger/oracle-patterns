select *
from
  top_n_test
where
  rownum < 4
order by
  num;
