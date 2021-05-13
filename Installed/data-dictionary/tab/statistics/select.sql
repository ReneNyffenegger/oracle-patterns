--
-- Make sure statistics are up to date for a schema:
--
exec dbms_stats.gather_schema_stats('RENE');

--
-- Select statistics
--
select
-- tst.owner                      ,
   tst.table_name                 ,
   tst.num_rows                   ,
   tst.blocks                     ,
   tst.avg_row_len                ,
   tst.sample_size                , -- Number or rows sampled
   tst.empty_blocks               ,
   tst.chain_cnt                  ,
   tst.avg_space                  ,
   tst.partition_name             ,
   tst.partition_position         ,
   tst.subpartition_name          ,
   tst.subpartition_position      ,
   tst.object_type                ,
   tst.avg_space_freelist_blocks  ,
   tst.num_freelist_blocks        ,
   tst.avg_cached_blocks          ,
   tst.avg_cache_hit_ratio        ,
   tst.im_imcu_count              ,
   tst.im_block_count             ,
   tst.im_stat_update_time        ,
   tst.scan_rate                  ,
   tst.last_analyzed              ,
   tst.global_stats               , -- YES: incrementally gathered or maintained
   tst.user_stats                 , -- YES: statistics were entered by a user
   tst.stattype_locked            ,
   tst.stale_stats                , -- YES: Oracle thinks statistics are stale
   tst.notes                      ,
   tst.scope
from
   all_tab_statistics tst
where
   tst.owner      = 'RENE'     and
   tst.num_rows   is not  null and
   tst.table_name not like 'BIN$%' -- Exclude recycle bin tables
order by
   tst.blocks desc nulls last
;
