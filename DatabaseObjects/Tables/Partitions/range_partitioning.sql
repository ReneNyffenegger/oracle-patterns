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


select partition_name from user_tab_partitions where table_name = 'TQ84_RANGE_PARTITION';


drop table tq84_range_partition purge;
