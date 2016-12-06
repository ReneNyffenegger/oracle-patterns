select
  dbtimezone,
  sessiontimezone
from
  dual;
--
-- DBTIME SESSIONTIMEZONE
-- ------ -----------------------
-- +02:00 +01:00


alter session set time_zone = '-3:00';

select
  dbtimezone,
  sessiontimezone
from
  dual;
--
-- DBTIME SESSIONTIMEZONE
-- ------ ---------------------
-- +02:00 -03:00
