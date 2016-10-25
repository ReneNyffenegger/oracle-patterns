select /*+ ordered */
  round( (sysdate - to_date(trx.start_time, 'mm/dd/yy hh24:mi:ss')) * 24 * 60, 1 ) start_minutes_ago,
  trx.log_io         logical_io,
  trx.phy_io         physical_io,
  trx.cr_get         consistent_gets,
  trx.cr_change      consistent_changes,
  --
  trx.used_urec      unco_records_used,
  trx.used_ublk      undo_blocks_used,
  --
  sql.sql_text,
  --
  trx.xidusn         undo_segment_number,
  trx.xidslot        slot_number,
  trx.xidsqn         sequence_number,
  --
  trx.ubafil         undo_block_address_filenum,
  trx.ubablk         uba_block_number,
  trx.ubasqn         uba_block_sequence,
  trx.ubarec         uba_record_number,
  trx.status,
  trx.start_scnb     system_change_number,
  trx.start_scnw     scn_wrap,
  trx.start_uext     start_extent_number,
  trx.start_ubafil   start_ubafile,
  trx.start_ubablk   start_uba_block,
  trx.start_ubasqn   start_uba_sequence_number,
  trx.start_ubarec   start_uba_record_nubmer,
--trx.ses_addr       session_address,
  trx.ptx            parallel_transaction
from
  v$transaction  trx                                 join
  v$session      ses on trx.ses_addr = ses.saddr     join
  v$sqlarea      sql on ses.sql_id   = sql.sql_id
--where
--  trx.addr = '00000049DE4C7D98'
order by
  to_date(trx.start_time, 'mm/dd/yy hh24:mi:ss')
;
