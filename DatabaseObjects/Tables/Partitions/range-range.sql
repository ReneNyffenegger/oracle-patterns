create table tq84_part_range_range (
  id     number primary key,
  col_1  varchar2(10),
  dt     date                not null,
  nm     number              not null
)
   partition by range(dt) interval (numtoyminterval(1, 'year'))
subpartition by range(nm)
subpartition template (
   subpartition lt_0       values less than (       0),
   subpartition lt_1000    values less than (    1000),
   subpartition lt_1000000 values less than ( 1000000),
   subpartition lt_max     values less than (maxvalue)
)
(
  partition tq84_p1 values less than (date '2000-01-01')
)
;

insert into tq84_part_range_range values (1, 'a', date '2017-05-03', 9999);

exec dbms_stats.gather_table_stats(user, 'tq84_part_range_range');


select
  p.partition_name,
  s.subpartition_name,
  p.high_value,
  s.high_value,
  s.subpartition_position,
  s.num_rows
from
  user_tab_subpartitions s join
  user_tab_partitions    p on s.table_name     = p.table_name and
                              s.partition_name = p.partition_name
where
  s.table_name = 'TQ84_PART_RANGE_RANGE';

drop table tq84_part_range_range purge;
