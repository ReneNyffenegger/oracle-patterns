load data
infile 'load_2.dat' "str '\r\n'"
insert
into table tq84_sql_loader_2
fields terminated by ','
(
  field_1      char,
  field_2      integer external
)
