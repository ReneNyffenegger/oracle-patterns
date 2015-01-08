load data
infile 'load_09.dat' "str '\r\n'"
insert
into table tq84_sql_loader_09
(
  txt          position( 1:10),
  dt           position(11:20)  "nvl(to_date(trim(:dt), 'dd.mm.yyyy'), sysdate)",
  num          position(21:24) 
)
