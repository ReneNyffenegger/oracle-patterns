-- Interval partitions are much like range partitions, BUT they
-- can create new partitions automatically.

create table tq84_interval_partition (
  id   number,
  txt  varchar2(10),
  dt   date
)
partition by range (dt) 
interval (numtoyminterval(1, 'month')) (
  partition tq84_partition_1 values less than (date '2010-01-01')  
);

column high_value format a100

select partition_name, high_value from user_tab_partitions where table_name = 'TQ84_INTERVAL_PARTITION';

insert into tq84_interval_partition values (1, 'Part 1', date '1888-10-18');
select partition_name, high_value from user_tab_partitions where table_name = 'TQ84_INTERVAL_PARTITION';

insert into tq84_interval_partition values (2, 'New part', date '2010-08-13');
select partition_name, high_value from user_tab_partitions where table_name = 'TQ84_INTERVAL_PARTITION';

insert into tq84_interval_partition values (3, 'same part', date '2010-08-12');
select partition_name, high_value from user_tab_partitions where table_name = 'TQ84_INTERVAL_PARTITION';

insert into tq84_interval_partition values (4, 'anoth part', date '2011-02-20');
select partition_name, high_value from user_tab_partitions where table_name = 'TQ84_INTERVAL_PARTITION';

-- Select from specific partition:
--   1) name of partition is known
select * from tq84_interval_partition partition     (tq84_partition_1);
--   2) name of partition is unknown
select * from tq84_interval_partition partition for (date '2010-08-01');

drop table tq84_interval_partition purge;
