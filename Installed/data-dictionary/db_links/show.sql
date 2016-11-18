select
  owner,
  db_link,
  username,
  host,
  created
from
  dba_db_links
order by
  db_link;
