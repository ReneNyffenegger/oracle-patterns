load data
infile 'file-index.dat'
into    table tq84_sql_loader_blob
fields  terminated by '|'
(
   filename  char(20),
   author    char(16),
   url       char(80),
   image     lobfile(filename) terminated by eof
)
