create table tq84_table (
  id  number,
  txt varchar2(10),
  dt  date
);


create index tq84_global_partitioned_index on tq84_table (dt)
       global partition by range(dt) (
              partition tq84_ix_2010 values less than ( date '2011-01-01' ),
              partition tq84_ix_2011 values less than ( date '2012-01-01' ), 
              partition tq84_ix_2012 values less than ( date '2013-01-01' ),
              partition tq84_ix_9999 values less than (       maxvalue   ) 
       );


select
  index_name,
  index_type,
  partitioned
from
  user_indexes
where
  table_name = 'TQ84_TABLE';

--

select
  partition_name
from
  user_ind_partitions
where
  index_name = 'TQ84_GLOBAL_PARTITIONED_INDEX';



drop table tq84_table purge;
