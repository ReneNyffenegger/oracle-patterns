select
   bh.status                               bh_status,
   bh.dirty                                bh_dirty,
      -- free – Not currently in use
      -- xcur – Exclusive
      -- scur – Shared current
      -- cr   – Consistent read
      -- read – Being read from disk
      -- mrec – In media recovery mode
      -- irec – In instance recovery mode
   ----------------------------------------------------------------
-- et.owner seg_owner, et.segment_name seg_name,
-- bh.objd                                                                                bh_objd,
   ob.owner obj_owner, ob.object_name  obj_name,  ob.object_type                          obj_type,
   bh.block#                               bh_block#, bh.file#                            bh_file#,
   count(*                                      ) over (partition by bh.file#, bh.block#) cnt_of_same_block,
   count(case when bh.status = 'xcur' then 1 end) over (partition by bh.file#, bh.block#) cnt_of_same_block_xcur,
-- count(*) over ()                                                                       cnt_blocks,
   bh.cachehint                                                                           bh_cachehint,
   bh.cell_flash_cache                                                                    bh_cell_flash_cache,
-- bh.class#                                                                              bh_class#,
   decode(class#,
     1, 'data block'            ,
     2, 'sort block'            ,
     3, 'save undo block'       ,
     4, 'segment header'        ,
     5, 'save undo header'      ,
     6, 'free list'             ,
     7, 'extent map'            ,
     8, '1st level bitmap block',
     9, '2nd level bitmap block',
    10, '3rd level bitmap block',
    11, 'bitmap block'          ,
    12, 'bitmap index block'    ,
    13, 'file header block'     ,
    14, 'unused'                ,
    15, 'system undo header'    ,
    16, 'system undo block'     ,
    17, 'undo header'           ,
    18, 'undo block')                                                                     bh_class,
   bh.direct                                                                              bh_direct,
   bh.flash_cache                                                                         bh_flash_cache,
   bh.lobid                                                                               bh_lobid,
   bh.lock_element_addr                                                                   bh_lock_element_addr,
   bh.lock_element_class                                                                  bh_lock_element_class,
   bh.lock_element_name                                                                   bh_lock_element_name,
   bh.ping                                                                                bh_ping,
   bh.stale                                                                               bh_stale,
   bh.temp                                                                                bh_temp,
   bh.ts#                                                                                 bh_ts#,
-- bh.new                                                                                 bh_new,                 -- obsolete, always 'N'
-- bh.xnc                                                                                 bh_xnc,                 -- obsolete, always 0
-- bh.forced_reads                                                                        bh_forced_reads,        -- obsolete, always 0
-- bh.forced_writes                                                                       bh_forced_writes,       -- obsolete, always 0
   bh.con_id                                                                              bh_con_id
from
   v$bh             bh     /*                                                             left join
   dba_extents      et on  bh.file# = et.file_id and
                    bh.block# between et.block_id and et.block_id + et.blocks   */  left join
   dba_objects      ob on  bh.objd = ob.object_id
where
-- bh.status not in ('xcur', 'cr', 'free')
-- ob.object_name = '...'
   bh.class# = 2
order by
   cnt_of_same_block_xcur desc,
   cnt_of_same_block      desc,
   bh.status              desc,
   bh.block#,
   bh.file#
;
