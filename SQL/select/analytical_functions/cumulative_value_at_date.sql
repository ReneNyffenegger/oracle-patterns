--
-- tq84_x contains values (for examples: loans) that are valid
-- within a specific time frame (from_ until to_).
create table tq84_x(
  from_  date,
  to_    date,
  val_   number
);

insert into tq84_x values (date '2015-11-06', date '2015-12-03',    10);
insert into tq84_x values (date '2015-11-18', date '2015-11-27',    40);
insert into tq84_x values (date '2015-11-20', date '2015-12-09',   100);

--
-- The task is now to find the cumulative value when it changes:

with x as (
  select  from_ dt,  val_ from tq84_x union all
  select  to_   dt, -val_ from tq84_x
)
select
  dt,
  sum(val_) over (order by dt) cumulative_val_at_dt
from
  x;

-- DT                  CUMULATIVE_VAL_AT_DT
-- ------------------- --------------------
-- 06.11.2015 00:00:00                   10
-- 18.11.2015 00:00:00                   50
-- 20.11.2015 00:00:00                  150
-- 27.11.2015 00:00:00                  110
-- 03.12.2015 00:00:00                  100
-- 09.12.2015 00:00:00                    0


drop table tq84_x purge;
