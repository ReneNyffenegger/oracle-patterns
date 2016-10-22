@create_table.sql

host sqlldr userid=rene/rene  control=load.ctl

select * from tq84_sql_loader_12;

drop table tq84_trailing_nullcols purge;
