@create_table.sql

host sqlldr userid=rene/rene  control=without_trailing_nullcols.ctl

prompt Only one record loaded:
select * from tq84_trailing_nullcols;

host sqlldr userid=rene/rene  control=with_trailing_nullcols.ctl
prompt All (two) records loaded:
select * from tq84_trailing_nullcols;

drop table tq84_trailing_nullcols purge;
