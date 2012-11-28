start create_table

host  sqlldr control=load_3.ctl userid=rene

select * from tq84_sql_loader_3;

drop table tq84_sql_loader_3 purge;

prompt
prompt Check the load_3.dsc file
prompt
