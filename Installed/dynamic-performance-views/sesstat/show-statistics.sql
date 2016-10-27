select
  sest.sid,
  stat.name,
  sest.value
from
  v$sesstat  sest                                         join
  v$statname stat on sest.statistic# = stat.statistic#
;
