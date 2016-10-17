create table tq84_cons (
  col_a  number,
  col_b  varchar2(10),
  col_c  date,
  col_d  varchar2(10),
  col_e  number,
  --
  constraint tq84_cons_pk primary key(col_e, col_b)
);

select
  column_name
from
  user_cons_columns
where
  constraint_name = 'TQ84_CONS_PK'
order by
  position;
-- COL_E
-- COL_B
  
drop table tq84_cons purge;
