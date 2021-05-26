column dm_day    format a29
column dm_hour   format a29
column dm_minute format a29
column dm_second format a29
column ds_year   format a13
column ds_month  format a13

with num as (
   select   42    ber from dual union all
   select    1.5  ber from dual union all
   select  - 3.75 ber from dual
)
select
   num.ber,
   numtodsinterval(num.ber, 'day'   )  dm_day,
   numtodsinterval(num.ber, 'hour'  )  dm_hour,
   numtodsinterval(num.ber, 'minute')  dm_minute,
   numtodsinterval(num.ber, 'second')  dm_second,
   numtoyminterval(num.ber, 'year'  )  ds_year,
   numtoyminterval(num.ber, 'month' )  ds_month
from
   num;
--
--       BER DM_DAY                        DM_HOUR                       DM_MINUTE                     DM_SECOND                     DS_YEAR       DS_MONTH
------------ ----------------------------- ----------------------------- ----------------------------- ----------------------------- ------------- -------------
--        42 +000000042 00:00:00.000000000 +000000001 18:00:00.000000000 +000000000 00:42:00.000000000 +000000000 00:00:42.000000000 +000000042-00 +000000003-06
--       1.5 +000000001 12:00:00.000000000 +000000000 01:30:00.000000000 +000000000 00:01:30.000000000 +000000000 00:00:01.500000000 +000000001-06 +000000000-02
--     -3.75 -000000003 18:00:00.000000000 -000000000 03:45:00.000000000 -000000000 00:03:45.000000000 -000000000 00:00:03.750000000 -000000003-09 -000000000-04
