select
  sessiontimezone
from
  dual;
--
-- SESSIONTIMEZONE
-- -----------------------
-- +01:00


alter session set time_zone = '-3:00';

select
  sessiontimezone
from
  dual;
--
-- SESSIONTIMEZONE
-- ---------------------
-- -03:00
