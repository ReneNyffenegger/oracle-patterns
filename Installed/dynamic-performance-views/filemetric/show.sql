select
  df.name,
  physical_reads,
  physical_writes,
  physical_block_reads,
  physical_block_writes,
  --
  round(average_read_time  , 2)    avg_read_tm,
  round(average_write_time , 2)    avg_write_tm
from
  v$filemetric fm      join
  v$dbfile     df on fm.file_id = df.file#
order by
  greatest(average_read_time, average_write_time) desc;
