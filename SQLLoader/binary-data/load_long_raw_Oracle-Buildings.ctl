options(bindsize=267083, rows=1)
load data
  infile  'Oracle-Buildings.jpg'    "fix 14057"
concatenate 19                  --  19 * 14057 = 267083
preserve blanks
into table tq84_sql_loader_long_raw
append
(
  filename constant 'Oracle-Buildings.jpg' ,
  author   constant 'Otto Geldermann',
  url      constant 'https://ccsearch.creativecommons.org/photos/53cbf2b7-0bc2-427a-abc3-cbf0413d9abb',
  image    raw(267083)
)
