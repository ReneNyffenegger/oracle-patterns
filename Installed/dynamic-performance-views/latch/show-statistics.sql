select
  lnm.name,
  lat.addr,
  lat.gets,
  lat.misses,
  lat.sleeps,
  lat.immediate_gets,
  lat.immediate_misses,
  lah.pid                   latch_holder_pid
from
  v$latch       lat                              left join
  v$latchholder lah on lat.addr    = lah.laddr   left join
  v$latchname   lnm on lat.latch#  = lnm.latch#
order by
   lat.gets desc;
