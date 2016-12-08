select
  approx_count_distinct(owner) approx_cnt,
  count(distinct(owner))       exact_cnt
from
  dba_objects;
