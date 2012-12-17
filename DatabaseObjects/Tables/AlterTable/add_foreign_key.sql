create table tq84_table_with_pk (
       col_1 number primary key,
       col_2 number
);

create table tq84_table_for_fk (
       col_3 number,
       col_4 number
);



alter table tq84_table_for_fk 
  add constraint tq84_FK foreign key
     (col_3) references tq84_table_with_pk;


select
  table_name,
  r_constraint_name
from
  user_constraints
where
  constraint_name = 'TQ84_FK';


drop table tq84_table_for_fk  purge;
drop table tq84_table_with_pk purge;
