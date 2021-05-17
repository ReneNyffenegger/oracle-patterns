drop table tq84_list_partition purge;

create table tq84_list_partition (
  id     number,
  txt    varchar2(10),
  sector varchar2(10),
  --
  constraint tq84_list_partition_pk primary key (id)
)
partition by list (sector) (
  partition tq84_list_partition_east  values ('East' ),
  partition tq84_list_partition_west  values ('West' ),
  partition tq84_list_partition_north values ('North'),
  partition tq84_list_partition_south values ('South', 'Center')
);

select partition_name from user_tab_partitions where table_name = 'TQ84_LIST_PARTITION';
--
-- TQ84_LIST_PARTITION_EAST
-- TQ84_LIST_PARTITION_NORTH
-- TQ84_LIST_PARTITION_SOUTH
-- TQ84_LIST_PARTITION_WEST

insert into tq84_list_partition values (1, 'eee', 'East');
insert into tq84_list_partition values (2, 'EEE', 'East');

insert into tq84_list_partition values (3, 'w'  , 'West');
insert into tq84_list_partition values (4, 'ww' , 'West');

commit;
