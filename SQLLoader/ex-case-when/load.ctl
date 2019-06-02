load data
infile 'load.dat' -- "str '\r\n'"
truncate into table tq84_sql_loader_case_when
fields terminated by ';' (
  type_ "case :type_ 
               when '1' then 'foo'
               when '2' then 'bar'
               when '3' then 'baz'
               else        '???'
         end",
  num char
)
