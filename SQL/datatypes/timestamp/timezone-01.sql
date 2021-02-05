column sessiontimezone        format a6
column col_timestamp          format a24
column col_timestamp_tz       format a31
column col_timestamp_tz_loc   format a24

create table tq84_date_data_types (
  col_date                      date,
  col_timestamp                 timestamp,
  col_timestamp_tz              timestamp with       time zone,
  col_timestamp_tz_loc          timestamp with local time zone
);

insert into tq84_date_data_types values (sysdate, sysdate, sysdate, sysdate);


select sessiontimezone, dt.* from tq84_date_data_types dt;
--
-- SESSIO COL_DATE            COL_TIMESTAMP            COL_TIMESTAMP_TZ                COL_TIMESTAMP_TZ_LOC
-- ------ ------------------- ------------------------ ------------------------------- ------------------------
-- +01:00 06.12.2016 16:36:48 06.12.16 16:36:48.000000 06.12.16 16:36:48.000000 +01:00 06.12.16 16:36:48.000000

alter session set time_zone = '-3:00';

insert into tq84_date_data_types values (sysdate, sysdate, sysdate, sysdate);

select sessiontimezone, dt.* from tq84_date_data_types dt;
--
-- SESSIO COL_DATE            COL_TIMESTAMP            COL_TIMESTAMP_TZ                COL_TIMESTAMP_TZ_LOC
-- ------ ------------------- ------------------------ ------------------------------- ------------------------
-- -03:00 06.12.2016 16:36:48 06.12.16 16:36:48.000000 06.12.16 16:36:48.000000 +01:00 06.12.16 12:36:48.000000
-- -03:00 06.12.2016 16:36:48 06.12.16 16:36:48.000000 06.12.16 16:36:48.000000 -03:00 06.12.16 16:36:48.000000

drop table tq84_date_data_types purge;
