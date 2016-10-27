select 
  to_char((select count(*) from  v$bh), '999,999,999') cnt_bh,
  to_char((select
      bytes/(select value from v$parameter where name = 'db_block_size')
    from
       v$sgainfo
    where
      name = 'Buffer Cache Size'
  ), '999,999,999') buf_cache_size
from
  dual;
