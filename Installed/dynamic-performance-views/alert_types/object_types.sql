select
--count(*),
  object_type
from
  v$alert_types
group by
  object_type
order by
  lower(object_type);
--
-- ASM INSTANCE
-- CLUSTER NODE
-- DATA OBJECT
-- DATABASE
-- EVENT_CLASS
-- FILE
-- GLOBAL SERVICE
-- GoldenGate Apply
-- GoldenGate Capture
-- GoldenGate Propagation
-- INSTANCE
-- QUOTA
-- RECOVERY AREA
-- ROLLBACK SEGMENT
-- SERVICE
-- SESSION
-- Streams
-- Streams Apply
-- Streams Capture
-- Streams Propagation
-- SYSTEM
-- TABLESPACE
-- WORKLOAD REPLAY CLIENT
-- XStream Apply
-- XStream Capture
-- XStream Propagation
