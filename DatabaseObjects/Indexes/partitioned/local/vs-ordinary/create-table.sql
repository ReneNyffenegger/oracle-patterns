drop table tq84_part_ix_test;

create table tq84_part_ix_test (
   id     number,
   meta   varchar2(10),
   val_1  number,
   val_2  number,
   val_3  number
)
partition    by range (id  ) interval (10000)
subpartition by list  (meta)
subpartition template (
   subpartition sp_foo values ('foo'),
   subpartition sp_bar values ('bar'),
   subpartition sp_baz values ('baz')
)(
   partition    p_lt_10000 values less than (10000)
);

