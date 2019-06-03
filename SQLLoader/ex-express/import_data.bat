sqlldr rene/rene@ora18                             ^
  data                   = some.dat                ^
  table                  = tq84_sql_loader_express ^
  external_table         = not_used                ^
  field_names            = first_ignore            ^
  characterset           = utf8                    ^
  errors                 = 0                       ^
  silent                 = header,feedback         ^
  optionally_enclosed_by ='\"'
