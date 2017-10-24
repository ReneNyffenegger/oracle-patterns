create table tq84_part_range_list (
  col_dt   date,
  col_vc   varchar2(10),
  dat      varchar2(10)
)
   partition by range (col_dt) 
subpartition by list  (col_vc) (
------------------------------
  partition p1      values less than (date '2013-01-01') (
  ------------
     subpartition p1_foo  values ('foo'  ),
     subpartition p1_bar  values ('bar'  ),

     subpartition p1_baz  values ('baz'  ),
     subpartition p1_def  values (default)
  ),
  partition p13     values less than (date '2014-01-01') (
  -------------
     subpartition p13_foo values ('foo'  ),
     subpartition p13_bar values ('bar'  ),
     subpartition p13_baz values ('baz'  ),
     subpartition p13_def values (default)
  ),
  partition p14     values less than (date '2015-01-01') (
  -------------
     subpartition p14_foo values ('foo'  ),
     subpartition p14_bar values ('bar'  ),
     subpartition p14_baz values ('baz'  ),
     subpartition p14_def values (default)
  ),
  partition p99     values less than (maxvalue) (
  -------------
     subpartition p99_foo values ('foo'  ),
     subpartition p99_bar values ('bar'  ),
     subpartition p99_baz values ('baz'  ),
     subpartition p99_def values (default)
  )
);


select
  object_name,
  subobject_name,
  object_type
from
  user_objects
where
  object_name = 'TQ84_PART_RANGE_LIST'
--created > sysdate - 1 /24/60
;


select
  partitioning_type,
  subpartitioning_type,
  partition_count,
  def_subpartition_count
from
  user_part_tables
where
  table_name = 'TQ84_PART_RANGE_LIST';


set long 90
column high_value format a90
select
  composite,
  partition_name,
  subpartition_count,
  high_value
from
  user_tab_partitions
where
  table_name = 'TQ84_PART_RANGE_LIST';


select
  partition_name,
  subpartition_name,
  subpartition_position,
  high_value
from
  user_tab_subpartitions
where
  table_name = 'TQ84_PART_RANGE_LIST';

drop table tq84_part_range_list;
