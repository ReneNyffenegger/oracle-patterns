select
   regexp_substr(txt, '.+', 1, level, 'm') line
from
   tq84_text
start with
   id = 2
connect by
   prior id = id                                 and
   level   <= regexp_count(prior txt, '.+' , 1, 'm')
;
