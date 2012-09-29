create table tq84_list_partition (
  id     number,
  txt    varchar2(10),
  sector varchar2(10)
)
partition by list (sector) (
  partition tq84_list_partition_east  values ('East' ),
  partition tq84_list_partition_west  values ('West' ),
  partition tq84_list_partition_north values ('North'),
  partition tq84_list_partition_south values ('South', 'Center')
);

select partition_name from user_tab_partitions where table_name = 'TQ84_LIST_PARTITION';

drop table tq84_list_partition purge;
