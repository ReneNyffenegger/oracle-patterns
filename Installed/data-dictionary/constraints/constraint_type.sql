select
  -- count(*),
  constraint_type
from
  dba_constraints
group by
  constraint_type
order by
  count(*) desc;
-- C
-- P
-- R
-- O
-- U
-- F
-- V  
