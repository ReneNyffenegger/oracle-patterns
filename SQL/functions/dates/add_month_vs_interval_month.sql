--
--
--  add_months:  If date is the last day of the month or if the resulting month
--  has fewer days than the day component of date, then the result is the last
--  day of the resulting month.
--


alter session set nls_date_format = 'dd.mm.yyyy';

select
  add_months(date '2014-09-30',            6)        "add_months",     -- 31.03.2015
             date '2014-09-30' + interval '6' month  "interval",       -- 30.03.2015
  --
  add_months(date '2014-03-31',            6)        "add_months 2"    -- 30.09.2014
--           date '2014-03-31' + interval '6' month  "interval j2"     -- ORA-01839: date not valid for month specified
from
  dual;
