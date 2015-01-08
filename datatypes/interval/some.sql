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


insert into tq84_intervals values (
  numtoyminterval(
    months_between(date '2015-10-10',
                   date '2017-10-10'),
    'month'   
  ), 
  numtodsinterval(1 + 2/24 + 3/24/60 + 4/24/26/60, 'day'
  )
);


select * from tq84_intervals
  where
    ds < numtodsinterval(2, 'day');

drop table tq84_intervals purge;
