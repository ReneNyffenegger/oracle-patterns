create table tq84_range_partition (
  id   number,
  txt  varchar2(15),
  dt   date
)
partition by range (dt) (
  partition tq84_range_partition_2009  values less than (date '2010-01-01'),
  partition tq84_range_partition_2010  values less than (date '2011-01-01'),
  partition tq84_range_partition_2011  values less than (date '2012-01-01'),
  partition tq84_range_partition_max   values less than (      maxvalue   )
);


create unique index tq84_non_local on tq84_range_partition (id);

insert into tq84_range_partition values( 9, 'nine'  , date '2009-09-09');
insert into tq84_range_partition values(10, 'ten'   , date '2010-10-10');
insert into tq84_range_partition values(11, 'eleven', date '2011-11-11');
insert into tq84_range_partition values(12, 'twelve', date '2012-12-12');



select status from user_indexes where index_name = 'TQ84_NON_LOCAL';
--
-- VALID
--

--
-- Droping one partition:
--
alter table tq84_range_partition drop partition tq84_range_partition_2010;

select status from user_indexes where index_name = 'TQ84_NON_LOCAL';
--
-- UNUSABLE
--

--
-- Because the index is unusable AND unique, the following statement generates
--
--      ORA-01502: index 'SNB_DBA.TQ84_NON_LOCAL' or partition of
--      such index is in unusable state
--
-- If the index were not unique, the insert statement would not fail.
--
insert into tq84_range_partition values(13, 'does not work', date '2011-05-17');
-- 
--         ID TXT             DT
-- ---------- --------------- -------------------
--          9 nine            09.09.2009 00:00:00
--         11 eleven          11.11.2011 00:00:00
--         12 twelve          12.12.2012 00:00:00
-- 
select * from tq84_range_partition;

drop table tq84_range_partition purge;
