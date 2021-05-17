insert into tq84_range_list values ( 50, 'bar', 1.1);

column    partition_name format a30
column subpartition_name format a30
column high_value        format a30

select
   subpar.partition_name,
   subpar.subpartition_name,
   tabpar.high_value
from
  user_tab_partitions    tabpar join
  user_tab_subpartitions subpar on   tabpar.table_name = subpar.table_name
where
  tabpar.table_name = 'TQ84_RANGE_LIST';

insert into tq84_range_list values (350, 'baz', 7.7);

select
   subpar.partition_name,
   subpar.subpartition_name,
   tabpar.high_value
from
  user_tab_partitions    tabpar join
  user_tab_subpartitions subpar on   tabpar.table_name = subpar.table_name
where
  tabpar.table_name = 'TQ84_RANGE_LIST';

drop table tq84_range_list;
