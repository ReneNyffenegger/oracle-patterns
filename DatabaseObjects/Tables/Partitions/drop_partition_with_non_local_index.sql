create table tq84_range_partition (
  id   number,
  txt  varchar2(10),
  dt   date
)
partition by range (dt) (
  partition tq84_range_partition_2010  values less than (date '2011-01-01'),
  partition tq84_range_partition_2011  values less than (date '2012-01-01'),
  partition tq84_range_partition_2012  values less than (date '2013-01-01'),
  partition tq84_range_partition_9999  values less than (      maxvalue   )
);


create index tq84_non_local on tq84_range_partition (id);

declare
  start_date  date := date '2010-01-01';
  end_date    date := date '2014-12-31';
begin

  for r in 0 .. end_date - start_date loop

      insert into tq84_range_partition values (r, 'foo bar', start_date + r);

  end loop;

end;
/

select 'Count before drop: ' || count(*) cnt from tq84_range_partition;

select partition_name from user_tab_partitions where table_name = 'TQ84_RANGE_PARTITION';

alter table tq84_range_partition drop partition tq84_range_partition_2010;

select 'Count after drop: ' || count(*)  cnt from tq84_range_partition;

select partition_name from user_tab_partitions where table_name = 'TQ84_RANGE_PARTITION';
drop table tq84_range_partition purge;
