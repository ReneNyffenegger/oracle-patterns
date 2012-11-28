start create_table

host  sqlldr control=load_1.ctl userid=rene

select * from tq84_sql_loader_1;

drop table tq84_sql_loader_1;
