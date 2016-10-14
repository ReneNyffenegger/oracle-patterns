with gv as (select substr(lower(name), 4) n from v$fixed_table where substr(name, 1, 3) = 'GV$'),
      v as (select substr(lower(name), 3) n from v$fixed_table where substr(name, 1, 2) =  'V$')
select
  nvl2(gv.n, 'gv', '-')          gv$,
  nvl2( v.n,  'v', '-')           v$,
  nvl (gv.n, v.n)         name_wo_v$
from
  v full outer join
 gv on v.n = gv.n
order by
  nvl (gv.n, v.n);
