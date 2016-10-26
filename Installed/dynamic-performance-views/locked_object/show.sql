select
  obj.object_name       obj_name,
--obj.object_type       obj_type,
  obj.owner             obj_owner,
  lbj.locked_mode,
  lbj.oracle_username,
--ses.username,
  lbj.os_user_name,
--ses.osuser,
  ses.program,
  ses.taddr,
--trx.addr,
  ses.process
--lbj.xidusn            undo_segment_nr,
--lbj.xidslot           slot_nr,
--lbj.xidsqn            sequence_nr,
from
  v$locked_object     lbj                                    join
  v$session           ses on lbj.session_id = ses.sid        join
  dba_objects         obj on lbj.object_id  = obj.object_id
--v$transaction       trx on lbj.xidusn     = trx.xidusn  and
--                           lbj.xidslot    = trx.xidslot and
--                           lbj.xidsqn     = trx.xidsqn
;
