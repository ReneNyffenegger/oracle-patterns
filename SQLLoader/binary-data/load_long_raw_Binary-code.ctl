options(bindsize=197032, rows=1)
load data
infile  'Binary-code.jpg'    "fix 49258"
concatenate 4             --  4 * 49258 = 197032
preserve blanks
into table tq84_sql_loader_long_raw
append
(
  filename constant 'Binary-code.jpg' ,
  author   constant 'Christiaan Colen',
  url      constant 'https://ccsearch.creativecommons.org/photos/f63dd034-4de4-49c8-a500-270aedec50c5',
  image    raw(197032)
)
