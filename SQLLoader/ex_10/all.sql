start create_table.sql
start create_func.plsql

host sqlldr control=load.ctl userid=rene/rene

select * from tq84_sql_loader_10;

prompt
prompt check load.bad file
prompt
