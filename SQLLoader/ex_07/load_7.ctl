load data
infile 'load_7.dat' "str '\r\n'"
insert
into table tq84_sql_loader_7
fields terminated by ','
(
  field_3      char,
  field_2      char,
  field_4      char,
  field_1      char
)
