alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

create table tq84_calendar (
  dt_begin date not null,
  dt_end   date not null,
  what     varchar2(20),
  --
  check (dt_begin < dt_end)
);

insert into tq84_calendar
with entries as (
  select '08:00' start_, '08:30' end_, 'Meeting 1' what from dual union all
  select '09:00' start_, '10:00' end_, 'Meeting 2' what from dual union all
  select '10:30' start_, '11:00' end_, 'Meeting 3' what from dual union all
  select '11:00' start_, '11:30' end_, 'Meeting 4' what from dual union all
  select '12:00' start_, '13:30' end_, 'Lunch'     what from dual union all
  select '15:00' start_, '16:00' end_, 'Meeting 5' what from dual union all
  select '16:30' start_, '17:00' end_, 'Meeting 6' what from dual
)
select
   '2010-10-10 ' || start_ || ':00',
   '2010-10-10 ' || end_   || ':00',
    what
from
  entries;

select
  to_char(free_begin, 'hh24:mi') free_begin,
  to_char(free_end  , 'hh24:mi') free_end
from (
  select
    max (dt_end  ) over (order by dt_begin) free_begin,
    lead(dt_begin) over (order by dt_begin) free_end
  from
    tq84_calendar
)
where free_begin < free_end;
-- 
-- FREE_ FREE_
-- ----- -----
-- 08:30 09:00
-- 10:00 10:30
-- 11:30 12:00
-- 13:30 15:00
-- 16:00 16:30

drop table tq84_calendar;
