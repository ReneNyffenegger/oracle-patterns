drop   table tq84_char_interval_partition purge;
create table tq84_char_interval_partition (
  id      number primary   key,
  month_6 char    ( 6) not null,
  col_1   varchar2(10) not null,
  col_2   varchar2(10),
  --
  partition_nr number visible generated always as (months_between(to_date(month_6, 'yyyymm'), date '2000-01-01'))
)
partition by
  range   (partition_nr)
  interval(           1) (
    partition tq84_char_interval_p0 values less than (0)
  )
;


insert into tq84_char_interval_partition values (1, '201707', 'foo', 'bla'     , default);
insert into tq84_char_interval_partition values (2, '201707', 'bar', 'more bla', default);
insert into tq84_char_interval_partition values (3, '201103', 'baz', null      , default);

select * from tq84_char_interval_partition;

select * from tq84_char_interval_partition partition for (210);
select * from tq84_char_interval_partition partition for (months_between(date '2017-07-01', date '2000-01-01'));
