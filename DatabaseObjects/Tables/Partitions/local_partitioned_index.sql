--
--     Local partitioned indexes can be further divided into 
--        o  local prefixed indexes and
--        o  local nonprefixed indexes
--    (See -> local_prefixed_vs_non_prefixed_index.sql).
--

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

create index tq84_range_partition_ix_local on tq84_range_partition(id) local;
create index tq84_range_partition_ix_      on tq84_range_partition(dt)      ;

--
select 
  ix.index_name, 
     partition_name
from 
  user_tab_partitions tb join
  user_ind_partitions ix using (partition_name)
where
  tb.table_name = 'TQ84_RANGE_PARTITION';
--

select 
  index_type,
  partitioned/*,
  prefix_length*/
from 
  user_indexes
where
  table_name = 'TQ84_RANGE_PARTITION';

drop table tq84_range_partition purge;
