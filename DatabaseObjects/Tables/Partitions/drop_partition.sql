create table tq84_list_partition (
  id     number,
  txt    varchar2(10),
  --
  constraint tq84_list_partition_pk primary key (id)
)
partition by list (txt) (
  partition tq84_list_partition_foo  values ('foo'  ),
  partition tq84_list_partition_bar  values ('bar'  ),
  partition tq84_list_partition_baz  values ('baz'  ),
  partition tq84_list_partition_else values (default)
);


column    object_name format a24
column subobject_name format a24
column    object_type format a15

select
  object_name,
  subobject_name,
  object_type
from
  user_objects
where
  object_name like 'TQ84_LIST_PARTITION%';
--
-- OBJECT_NAME              SUBOBJECT_NAME           OBJECT_TYPE
-- ------------------------ ------------------------ ---------------
-- TQ84_LIST_PARTITION_PK                            INDEX
-- TQ84_LIST_PARTITION      TQ84_LIST_PARTITION_ELSE TABLE PARTITION
-- TQ84_LIST_PARTITION      TQ84_LIST_PARTITION_BAZ  TABLE PARTITION
-- TQ84_LIST_PARTITION      TQ84_LIST_PARTITION_BAR  TABLE PARTITION
-- TQ84_LIST_PARTITION                               TABLE


insert into tq84_list_partition values ( 1, 'foo');
insert into tq84_list_partition values ( 2, 'bar');
insert into tq84_list_partition values ( 3, 'baz');
insert into tq84_list_partition values ( 4, '???');

alter table tq84_list_partition drop partition tq84_list_partition_foo;

select * from tq84_list_partition;
-- 
--         ID TXT
-- ---------- ----------
--          2 bar
--          3 baz
--          4 ???

select
  object_name,
  subobject_name,
  object_type
from
  user_objects
where
  object_name like 'TQ84_LIST_PARTITION%';
-- 
-- OBJECT_NAME              SUBOBJECT_NAME           OBJECT_TYPE
-- ------------------------ ------------------------ ---------------
-- TQ84_LIST_PARTITION_PK                            INDEX
-- TQ84_LIST_PARTITION      TQ84_LIST_PARTITION_ELSE TABLE PARTITION
-- TQ84_LIST_PARTITION      TQ84_LIST_PARTITION_BAZ  TABLE PARTITION
-- TQ84_LIST_PARTITION      TQ84_LIST_PARTITION_BAR  TABLE PARTITION
-- TQ84_LIST_PARTITION                               TABLE

drop table tq84_list_partition purge;
