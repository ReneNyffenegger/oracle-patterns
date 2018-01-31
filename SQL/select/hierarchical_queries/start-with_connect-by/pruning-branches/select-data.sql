select
  lpad(' ', 2*level) || child
from
  prune_test
start with
  parent is null
connect by
  prior child = parent and
  parent not in (1, 71)  -- Exclude children below and 71
; 
