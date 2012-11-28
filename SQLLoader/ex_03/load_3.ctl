load data
infile 'load_3.dat' "str '\r\n'"
discardfile 'load_3.dsc'
insert
into table tq84_sql_loader_3
when field_2 = 'Fruit'
fields terminated by ';'
(
  field_1      char,
  field_2      char
)
