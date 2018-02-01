select *
from
  top_n_test
order by
  num
fetch first 3 rows only;
