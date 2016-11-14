create table tq84_interval_partition_number (
  id   number,
  txt  varchar2(10),
  dt   date
)
partition by range (id) 
interval (1) (
  partition tq84_int_part_num_1 values less than (1)  
);

insert into tq84_interval_partition_number values (0, 'foo', null   );
insert into tq84_interval_partition_number values (1, 'bar', sysdate);
insert into tq84_interval_partition_number values (2, 'baz', null   );

select
  partition_name
from
  user_tab_partitions
where
  table_name = 'TQ84_INTERVAL_PARTITION_NUMBER';

explain plan for select * from tq84_interval_partition_number where id = 2;
select * from table(dbms_xplan.display);

drop table tq84_interval_partition_number purge;
