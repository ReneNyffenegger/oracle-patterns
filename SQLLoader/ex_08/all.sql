start create_table

host  sqlldr control=load_8.ctl userid=rene

select * from tq84_sql_loader_8;

drop table tq84_sql_loader_8;

prompt
prompt Check load_8.bad file
prompt
