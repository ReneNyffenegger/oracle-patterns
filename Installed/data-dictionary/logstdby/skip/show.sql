select
  owner,
  name,
  statement_opt,
  use_like,
  esc,
  proc,
  error
from
  dba_logstdby_skip
order by
  owner;
