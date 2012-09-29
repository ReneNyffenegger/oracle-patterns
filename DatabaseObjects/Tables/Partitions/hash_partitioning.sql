create table tq84_hash_partition (
  id  number,
  txt varchar2(10)
)
partition by hash (txt) 
partitions 4;


select partition_name from user_tab_partitions where table_name = 'TQ84_HASH_PARTITION';


drop table tq84_hash_partition purge;
