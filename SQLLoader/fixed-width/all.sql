@ create_table

host  sqlldr control=load_1.ctl userid=rene/rene

column num format 99990.99
select
   load_time,
   num,
   txt_1 || '<' txt_1,
   txt_2 || '<' txt_2
from
   tq84_sql_loader_1;

drop table tq84_sql_loader_1;
