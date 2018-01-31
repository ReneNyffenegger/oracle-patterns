create table tq84_partitioned (
  id   number,
  txt  varchar2(15),
  dt   date
)
partition by range (dt) (
  partition tq84_partitioned_2009 values less than (date '2010-01-01'),
  partition tq84_partitioned_2010 values less than (date '2011-01-01'),
  partition tq84_partitioned_2011 values less than (date '2012-01-01'),
  partition tq84_partitioned_max  values less than (      maxvalue   )
);


--
-- Create a local, prefix aligned index.
--
alter table tq84_partitioned add constraint tq84_partitioned_pk primary key (dt, id) using index local;

--
-- If the order of dt and id would have been the other way round,
-- such as in the following statement, it would have created
-- a local, non-prefixed index.
--
-- alter table tq84_partitioned add constraint tq84_partitioned_pk primary key (id, dt) using index local;

insert into tq84_partitioned values (10, 'ten'   , date '2010-10-10');
insert into tq84_partitioned values (11, 'eleven', date '2011-11-11');
insert into tq84_partitioned values (12, 'twelve', date '2011-12-12');


column index_name format a24
select
  index_name,
  index_type,
  status
from
  user_indexes
where
  table_name = 'TQ84_PARTITIONED';
-- 
-- INDEX_NAME               INDEX_TYPE                  STATUS
-- ------------------------ --------------------------- --------
-- TQ84_PARTITIONED_PK      NORMAL                      N/A  
-- 


select
  partitioning_type,
  alignment,
  locality
from 
  user_part_indexes
where
  table_name = 'TQ84_PARTITIONED';
-- 
-- PARTITION ALIGNMENT    LOCALI
-- --------- ------------ ------
-- RANGE     PREFIXED     LOCAL  
-- 
