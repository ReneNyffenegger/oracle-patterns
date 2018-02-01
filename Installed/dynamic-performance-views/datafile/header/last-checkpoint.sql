select
  substr(name, 1, 100)                              data_file,
  checkpoint_change#                                scn,
  to_char(checkpoint_time, 'dd.mm.yyyy hh24:mi:ss') date_
from
  v$datafile_header;
