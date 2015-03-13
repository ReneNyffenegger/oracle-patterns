options (skip=1, silent=(all))
load data
infile 'some.dat'
into table tq84_trailing_nullcols
truncate
fields terminated by '|'
trailing nullcols
(
  col_1,
  col_2,
  col_3
)
