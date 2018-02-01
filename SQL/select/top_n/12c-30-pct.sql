select *
from
  top_n_test
order by
  num
fetch first 30 percent rows only;
