start create_table

host  sqlldr control=load_09.ctl userid=rene/rene

select * from tq84_sql_loader_09;

drop table tq84_sql_loader_09 purge;
