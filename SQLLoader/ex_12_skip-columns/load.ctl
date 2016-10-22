load data
infile 'data.csv'
insert
into table tq84_sql_loader_12
fields 
  terminated by ',' 
(
  col_1           ,
  col_2     filler,
  col_3           ,
  col_4     filler,
  col_5
)

