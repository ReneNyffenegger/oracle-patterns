start create_table

host  sqlldr control=load_5.ctl userid=rene

select id, to_char(dt, 'dd.mm.yyyy') dt from tq84_sql_loader_5;

prompt
prompt  Note, record with "20101010" is also loaded
prompt

drop table tq84_sql_loader_5 purge;
