start create_table

host  sqlldr control=load_6.ctl    data=load_6.dat userid=rene
host  sqlldr control=load_6_ok.ctl data=load_6.dat userid=rene

select id, substrb(tx,1, 50) from tq84_sql_loader_6;

prompt
prompt  Note: Second record not loaded
prompt

drop table tq84_sql_loader_6    purge;

select id, substrb(tx,1, 50) from tq84_sql_loader_6_ok;
prompt
prompt  Note: Second record was loaded
prompt

drop table tq84_sql_loader_6_ok purge;
