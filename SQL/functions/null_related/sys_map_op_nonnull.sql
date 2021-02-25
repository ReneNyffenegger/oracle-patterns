create table tq84_sys_op_map_nonnull (
       col1  varchar2(1),
       col2  varchar2(1),
       col3  number
);

insert into tq84_sys_op_map_nonnull values (null, null,  1);
insert into tq84_sys_op_map_nonnull values (null,  'A',  2);
insert into tq84_sys_op_map_nonnull values ( 'B',  'B',  3);
insert into tq84_sys_op_map_nonnull values ( 'B',  'C',  4);

select *
from
  tq84_sys_op_map_nonnull
where
  sys_op_map_nonnull(col1) = sys_op_map_nonnull(col2);
--
-- C C       COL3
-- - - ----------
--              1
-- B B          3

drop table tq84_sys_op_map_nonnull;
