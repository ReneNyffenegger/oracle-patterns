drop table tq84_sql_loader_blob;
drop table tq84_sql_loader_long_raw;

start create_table
start create_table_long_raw

host sqlldr control=load.ctl                           userid=rene/rene@ORA18

host sqlldr control=load_long_raw_Binary-code.ctl      userid=rene/rene@ORA18
host sqlldr control=load_long_raw_Eschenbergturm.ctl   userid=rene/rene@ORA18
host sqlldr control=load_long_raw_Oracle-Buildings.ctl userid=rene/rene@ORA18

prompt

select
   filename,
   author,
-- url,
   dbms_lob.getlength(image) bytes_in_image
from
   tq84_sql_loader_blob;

exit
