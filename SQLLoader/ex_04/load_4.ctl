load data
infile 'load_4.dat' "str '\r\n'"
discardfile 'load_4.dsc'
insert
into table tq84_sql_loader_4_a
when field_2 = 'Fruit'
(
  field_1      position(1) char(8),
  field_2      position(9) char(5)
)
into table tq84_sql_loader_4_b
when field_2 = 'City'
(
  field_1      position(1) char(8),
  field_2      position(9) char(5)
)
