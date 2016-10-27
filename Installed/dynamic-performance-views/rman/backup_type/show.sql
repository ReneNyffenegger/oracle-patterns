select
  weight,
  lower(input_type) input_type
from
  v$rman_backup_type
order by
  input_type;
--
-- 4	archivelog
-- 1	backupset
-- 3	controlfile
-- 6	datafile full
-- 5	datafile incr
-- 9	db full
-- 7	db incr
-- 8	recvr area
-- 2	spfile
