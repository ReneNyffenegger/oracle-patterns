select
   approx_count_distinct(object_name) approx_cnt,
   count(distinct(object_name))       exact_cnt
from
   dba_objects;
