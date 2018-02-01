select *
from
  top_n_test
order by
  num
offset 4 rows
fetch next 2 rows only;
