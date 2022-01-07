create table tq84_column_width (
  col_1        number,
  col_2        varchar2(500)
);

insert into tq84_column_width values (1.049090920, 'alkdjfaj ladjkj kjnvoak zoijuwjd zoijd gh\amd');
insert into tq84_column_width values (7489899.409, '*132'                                         );


column col_1   format  999.99
column col_2   format  a30


select * from tq84_column_width;
--
--   COL_1 COL_2
-- ------- ------------------------------
--    1.05 alkdjfaj ladjkj kjnvoak zoijuw
--         jd zoijd gh\amd

drop table tq84_column_width purge;
