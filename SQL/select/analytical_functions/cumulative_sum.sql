--
--     http://stackoverflow.com/a/21315483/180275
--
create table tq84_sum_data_by_week (
  chrg_dt   date,
  wrk_hr    number
);

insert into tq84_sum_data_by_week values (date '2014-01-01', 4);
insert into tq84_sum_data_by_week values (date '2014-01-02', 8);
insert into tq84_sum_data_by_week values (date '2014-01-15', 7);


with fridays as (
  select
    date '2014-01-03' + (level-1) * 7 date_
  from dual
    connect by level <= 3
)
select 
  fridays.date_,
  sum(sum(weeks.wrk_hr)) over (order by fridays.date_)  total_hrs
from 
  fridays               left   outer join
  tq84_sum_data_by_week weeks
  on fridays.date_ = next_day(weeks.chrg_dt, 'fridays')
group by
  fridays.date_;

drop table tq84_sum_data_by_week purge;
