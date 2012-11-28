load data
infile 'load_1.dat' "str '\r\n'"
insert
into table tq84_sql_loader_1
(
  load_time    sysdate,
  field_2      position( 1:10),
  field_1      position(11:20)
)

