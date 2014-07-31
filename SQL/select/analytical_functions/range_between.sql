create table tq84_range_between (
   name      varchar2 (10) primary key,
   age       number  not null check (age = trunc(age)),
   sex       char(1) not null check (sex in ('m','f')),
   salary    number  not null
);


insert into tq84_range_between values ('Diana' ,30, 'f',    10000);
insert into tq84_range_between values ('Jane'  ,30, 'f',     9000);
insert into tq84_range_between values ('Peter' ,30, 'm',     7000);
insert into tq84_range_between values ('Tom'   ,30, 'm',    12000);

insert into tq84_range_between values ('Frank' ,32, 'm',    14000);

insert into tq84_range_between values ('Aloe'  ,33, 'f',    13000);

insert into tq84_range_between values ('sandy' ,34, 'f',    15000);


select
  name,
  age,
  sex,
  avg(salary) over (partition by sex order by age range between age * 0.1 preceding and age * 0.1 following) salary_avg_in_10_pct_range
from 
  tq84_range_between
order by
  age
  ;


-- NAME              AGE S SALARY_AVG_IN_10_PCT_RANGE
-- ---------- ---------- - --------------------------
-- Jane               30 f                 10666.6667         (10000+ 9000+13000) / 3
-- Diana              30 f                 10666.6667
-- Peter              30 m                      11000         ( 7000+12000+14000) / 3
-- Tom                30 m                      11000
-- Frank              32 m                      11000
-- Aloe               33 f                      11750         (10000+ 9000+13000+15000) / 4
-- sandy              34 f                      14000         (15000+ 13000) / 2



drop table tq84_range_between purge;
