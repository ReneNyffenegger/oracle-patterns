options(bindsize=197032, rows=1)
load data
  infile  'Eschenbergturm.jpg'    "fix 35879"
  concatenate 5                --  5 * 35789 = 179395
  preserve blanks
  into table tq84_sql_loader_long_raw
append 
(
  filename constant 'Eschenbergturm.jpg' ,
  author   constant 'Nouhailler',
  url      constant 'https://ccsearch.creativecommons.org/photos/bb7d21fe-40de-46cb-a6e1-02df76cfa15a',
  image    raw(179395)
)
