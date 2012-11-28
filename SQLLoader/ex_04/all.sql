start create_table

host sqlldr control=load_4.ctl userid=rene

prompt

select * from tq84_sql_loader_4_a;

prompt

select * from tq84_sql_loader_4_b;

drop table tq84_sql_loader_4_a purge;
drop table tq84_sql_loader_4_b purge;
