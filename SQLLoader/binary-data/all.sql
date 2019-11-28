
start create_table

host sqlldr control=load.ctl userid=rene/rene

prompt

select
   filename,
   author,
-- url,
   dbms_lob.getlength(image) bytes_in_image
from
   tq84_sql_loader_blob;

prompt

drop table tq84_sql_loader_blob;
