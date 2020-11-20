drop table timestamp_diff purge;

create table timestamp_diff as
select
   timestamp '2022-08-28 17:36:12.78'        -            1234.56                        as ts_nm,          -- date
   timestamp '2022-08-28 17:36:12.78'        - date      '1998-09-13'                    as ts_dt,          -- interval day(9) to second(9)
   timestamp '2022-08-28 17:36:12.78'        - timestamp '1998-09-13 06:51:38.41'        as ts_ts,          -- interval day(9) to second(9)
   timestamp '2022-08-28 17:36:12.78 +05:00' - timestamp '1998-09-13 06:51:38.41 +09:00' as ts_tz__ts_tz,   -- interval day(9) to second(9)
   date      '2022-08-28'                    - timestamp '1998-09-13 06:51:38.41'        as dt_ts           -- interval day(9) to second(9)
from
   dual
;

desc timestamp_diff;
