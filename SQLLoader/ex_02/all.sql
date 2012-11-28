start create_table

host  sqlldr control=load_2.ctl userid=rene

select * from tq84_sql_loader_2;

drop table tq84_sql_loader_2;

prompt
prompt Check load_2.bad file
prompt
