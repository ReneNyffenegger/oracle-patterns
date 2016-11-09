create table tq84_parent (
  pk_1    number  ,       --   primary key                  ,
  pk_2    number  ,       --   primary key                  ,
  flg_1   number(1) not null check (flg_1 in (0, 1      )),
  flg_2   number(1) not null check (flg_2 in (0, 1, 2, 3)),
  --
  constraint tq84_parent_pk primary key (pk_1, pk_2)
);

create table tq84_child (
  id         number primary key,
  fk_1       not null,
  fk_2       not null,
  txt        varchar2(20),
  --
  constraint tq84_child_fk foreign key (fk_1, fk_2) references tq84_parent
);

create bitmap index tq84_bitmap_index on
  tq84_child(
    tq84_parent.flg_1,
    tq84_parent.flg_2
  )
from
  tq84_parent,
  tq84_child
where
  tq84_parent.pk_1 = tq84_child.fk_1  and
  tq84_parent.pk_2 = tq84_child.fk_2;


select
  inner_table_name,
  outer_table_name,
  outer_table_column
from
  user_join_ind_columns
where
  index_name = 'TQ84_BITMAP_INDEX';
--
-- INNER_TABLE_NAME               OUTER_TABLE_NAME               OUTER_TABLE_COLUMN
-- ------------------------------ ------------------------------ ------------------------------
-- TQ84_CHILD                     TQ84_PARENT                    PK_1
-- TQ84_CHILD                     TQ84_PARENT                    PK_2

drop table tq84_child  purge;
drop table tq84_parent purge;
