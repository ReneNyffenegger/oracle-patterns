create table tq84_between (
  val  varchar2(10)    not null,
  dt_1 date            not null,
  dt_2 date            not null
);

alter session set nls_date_format  = 'dd.mm.yyyy hh24:mi:ss';

insert into tq84_between values ('one', '18.07.2010 15:30:19', '20.08.2010 16:20:18');
insert into tq84_between values ('two',                        '20.08.2010 16:20:18', '05.09.2016 07:51:32');


select * from tq84_between where '04.02.2009 08:08:08' between dt_1 and dt_2;

select * from tq84_between where '19.08.2010 22:23:24' between dt_1 and dt_2;

select * from tq84_between where '20.08.2010 16:20:18' between dt_1 and dt_2;

drop table tq84_between purge;
