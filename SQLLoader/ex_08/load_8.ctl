options(skip=1)
load data
infile 'load_8.csv'
insert
into table tq84_sql_loader_8
fields 
  terminated by ',' 
  optionally enclosed by '"'
(
  id,
  txt,
  num      "to_number(:num, '99999999999D9999', 'nls_numeric_characters=''.,''')",
  dt       "to_date(:dt, 'dd.mm.yyyy')"
)
