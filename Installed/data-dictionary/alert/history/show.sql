select
--reason_id,
  owner,
  object_name,
  subobject_name,
  object_type,
  reason
from
  dba_alert_history
order by
  sequence_id desc;
