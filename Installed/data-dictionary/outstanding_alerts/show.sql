select
 -- sequence_id
 -- reasonid,     -- Join with v$alert_Types
    reason,
    suggested_action,
    metric_value,
    message_type,
    message_level,
    advisor_name
    owner,
    object_name,
    subobject_name,
    object_type,
    message_group
 -- time_suggested,
 -- creation_time
from
    dba_outstanding_alerts;
