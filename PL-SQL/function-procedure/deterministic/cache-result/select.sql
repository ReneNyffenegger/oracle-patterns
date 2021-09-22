set rowprefetch 20
set arraysize   99 

truncate table tq84_call_log;  
select
               mod(level-1, 17)  a,
   tq84_double(mod(level-1, 17)) b
from
   dual connect by level <= 1000;
