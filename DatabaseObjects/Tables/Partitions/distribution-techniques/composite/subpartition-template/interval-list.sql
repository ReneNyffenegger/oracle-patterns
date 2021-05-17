create table tq84_interval_list (
   num  number,
   txt  varchar2(3),
   val  number
)
partition    by range (num) interval (100)
subpartition by list  (txt)
subpartition template (
   subpartition sp_foo values ('foo'),
   subpartition sp_bar values ('bar'),
   subpartition sp_baz values ('baz')
)
(
   partition p_init values less than (100)
);
