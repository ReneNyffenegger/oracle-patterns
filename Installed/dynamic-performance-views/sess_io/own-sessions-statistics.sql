--
-- Show session io statistics for executing session
--
select
  sio.block_gets,
  sio.consistent_gets,
  sio.physical_reads,
  sio.block_changes,
  sio.consistent_changes,
  sio.optimized_physical_reads
from
  v$session ses                        join
  v$sess_io sio on ses.sid = sio.sid
where
  ses.audsid = sys_context('userenv', 'sessionid');
