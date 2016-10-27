select
  df.name,
  max(case when fh.singleblkrdtim_milli =    1 then fh.singleblkrds end)   reads____1_ms,
  max(case when fh.singleblkrdtim_milli =    2 then fh.singleblkrds end)   reads____2_ms,
  max(case when fh.singleblkrdtim_milli =    4 then fh.singleblkrds end)   reads____4_ms,
  max(case when fh.singleblkrdtim_milli =    8 then fh.singleblkrds end)   reads____8_ms,
  max(case when fh.singleblkrdtim_milli =   16 then fh.singleblkrds end)   reads___16_ms,
  max(case when fh.singleblkrdtim_milli =   32 then fh.singleblkrds end)   reads___32_ms,
  max(case when fh.singleblkrdtim_milli =   64 then fh.singleblkrds end)   reads___64_ms,
  max(case when fh.singleblkrdtim_milli =  128 then fh.singleblkrds end)   reads__128_ms,
  max(case when fh.singleblkrdtim_milli =  256 then fh.singleblkrds end)   reads__256_ms,
  max(case when fh.singleblkrdtim_milli =  512 then fh.singleblkrds end)   reads__512_ms,
  max(case when fh.singleblkrdtim_milli = 1024 then fh.singleblkrds end)   reads_1024_ms,
  max(case when fh.singleblkrdtim_milli = 2048 then fh.singleblkrds end)   reads_2048_ms
from
  v$file_histogram fh                 left join
  v$dbfile         df on fh.file# = df.file#
group by
  df.name;
