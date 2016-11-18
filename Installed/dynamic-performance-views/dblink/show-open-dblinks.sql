select
  dbl.protocol,
  dbl.db_link,
  dbl.logged_on,
  dbl.heterogeneous,
  usr.username,
  dbl.open_cursors,
  dbl.in_transaction,
  dbl.update_sent,
  dbl.commit_point_strength
from
  v$dblink       dbl       left join
  dba_users      usr on dbl.owner_id = usr.user_id;
