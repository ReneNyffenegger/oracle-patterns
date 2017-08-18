drop   table tq84_char_interval_partition purge;

--
--  Create a table that is partitioned based upon the value of a text/character field (month_6).
--  The character field must contain a month in the yyyymm format.
--  The virtual and hidden column partition_nr is numeric and counts the months since
--  January 2000. Therefore, it can be used to partition the table.
--
create table tq84_char_interval_partition (
  id      number primary   key,
  month_6 char    ( 6) not null,
  col_1   varchar2(10) not null,
  col_2   varchar2(10),
  --
  partition_nr number invisible generated always as (months_between(to_date(month_6, 'yyyymm'), date '2000-01-01'))
)
partition by
  range   (partition_nr)
  interval(           1) (
    partition tq84_char_interval_p0 values less than (0)
  )
;


insert into tq84_char_interval_partition values (1, '201707', 'foo', 'bla'     );
insert into tq84_char_interval_partition values (2, '201707', 'bar', 'more bla');
insert into tq84_char_interval_partition values (3, '201103', 'baz',  null     );

select *                 from tq84_char_interval_partition;
select p.*, partition_nr from tq84_char_interval_partition p;

select * from tq84_char_interval_partition partition for (210);
select * from tq84_char_interval_partition partition for (months_between(date '2017-07-01', date '2000-01-01'));
