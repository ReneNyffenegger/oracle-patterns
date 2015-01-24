options(skip=1)
load data
infile 'data.csv'
insert
into table tq84_sql_loader_10
fields 
  terminated by ',' 
  optionally enclosed by '"'
(
  id,
  op        boundfiller,
  num1      boundfiller,
  num2      boundfiller,
  result   "tq84_func(:op, :num1, :num2)"
)
