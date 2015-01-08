create table tq84_intervals (
  ym  interval year to month,
  ds  interval day  to second(0)
);


insert into tq84_intervals values (
  numtoyminterval(
    months_between(date '2018-05-02',
                   date '2016-03-05'),
    'month'   
  ), 
  numtodsinterval(
      trunc(sysdate) + 4 + 7/24 + 26/24/60 + 19/24/26/60 
    - trunc(sysdate),
    'day'
  )
);


select * from tq84_intervals;

drop table tq84_intervals purge;
