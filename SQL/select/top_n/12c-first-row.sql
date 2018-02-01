select *
from
  top_n_test
order by
  num
fetch first row only;
