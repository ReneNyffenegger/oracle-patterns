create table tq84_table_1 (
   id    number primary key,  -- Note: without primary key, all columns in the view would become non-updatable.
   txt   varchar2(10)
);

create table tq84_table_2 (
   id    number,
   txt   varchar2(10)
);


create view tq84_updatable_join_view as
  select
    t1.id  id_1,
    t2.id  id_2,
    t1.txt txt_1,
    t2.txt txt_2
  from
    tq84_table_1   t1 join
    tq84_table_2   t2 on t1.id = t2.id;


select
  column_name,
  updatable
from
  user_updatable_columns
where
  table_name = 'TQ84_UPDATABLE_JOIN_VIEW';

drop view  tq84_updatable_join_view;
drop table tq84_table_2 purge;
drop table tq84_table_1 purge;
