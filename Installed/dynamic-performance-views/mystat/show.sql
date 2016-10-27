select 
  nam.name,
  mys.value
from
  v$mystat   mys   join
  v$statname nam on mys.statistic# = nam.statistic#
order by
  nam.name;
