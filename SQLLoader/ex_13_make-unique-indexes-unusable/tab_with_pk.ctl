options (
  direct=true,
  errors=0,
  parallel=false
)
unrecoverable
load data infile "tab_with_pk.dat"
into table tq84_tab_with_pk
append
fields terminated by ","
(
  id,
  txt
)
