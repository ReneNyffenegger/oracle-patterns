create table tq84_col_comments (
  col_nm number,
  col_vc varchar2(10),
  col_dt date
);

comment on column tq84_col_comments.col_nm is 'Column with numbers';
comment on column tq84_col_comments.col_vc is 'Column with varchars';
comment on column tq84_col_comments.col_dt is 'Column with dates';

select
  column_name,
  substrb(comments, 1, 50) comments
from
  user_col_comments
where
  table_name = 'TQ84_COL_COMMENTS';
-- COLUMN_NAME                    COMMENTS
-- ------------------------------ --------------------------------------------------
-- COL_NM                         Column with numbers
-- COL_VC                         Column with varchars
-- COL_DT                         Column with dates

drop table tq84_col_comments purge;
