start create_table

host  sqlldr control=load_7.ctl userid=rene

select * from tq84_sql_loader_7;

drop table tq84_sql_loader_7;

prompt
prompt Check load_7.bad file
prompt
