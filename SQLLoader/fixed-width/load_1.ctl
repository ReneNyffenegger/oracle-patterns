options (
   errors = 0
)
load data
infile
   'load_1.dat'
insert
-- preserve blanks
--
--    Note, uncommenting 'preserve blanks' will
--    preserve blanks on an input string's right side, but
--    not on an input string's left side.
--    Null/empty numbers won't be loaded with
--    preserve blanks, though!
--
   into table tq84_sql_loader_1
(
   load_time    sysdate,
   num          position( 1: 8),
   txt_1        position(10:16), -- Note the gap (column 9)
   txt_2        position(18:27)
)
