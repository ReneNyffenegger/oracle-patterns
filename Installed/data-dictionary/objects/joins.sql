select
  count(*) over (),
  obj.owner                                     obj_owner,
  obj.object_name                               obj_name,
  obj.object_type                               obj_type,
  tab.tablespace_name                           tab_ts,
  ind.index_type                                int_type,
  case when exd.directory_path is not null then
  exd.directory_path || '/' || ext.location
  end                                           ext_location,
  que.queue_table                               que_table,
  que.queue_type                                que_type,
  typ.type_oid                                  typ_oid,
  syn.table_owner || '.' || syn.table_name      syn_target,
  tpt.subpartition_count                        tpt_subpartition_cnt,
  clu.tablespace_name                           clu_ts,
  clt.clustering_type                           clt_clustering_type,
  clt.on_load                                   clt_on_load,
  clt.on_datamovement                           clt_on_datamovement,
  clt.with_zonemap                              clt_with_zonemap,
  seq.last_number                               seq_last_num,
  vie.text                                      vie_text,
  dir.directory_path                            dir_path,
  edi.usable                                    edi_usable
from
  dba_objects             obj                                                                                                                        left join
  dba_clustering_tables   clt on obj.owner = clt.         owner and obj.object_name = clt.   table_name                                              left join
  dba_clusters            clu on obj.owner = clu.         owner and obj.object_name = clu. cluster_name                                              left join
  dba_directories         dir on obj.owner = dir.         owner and obj.object_name = dir.directory_name                                             left join
  dba_editions            edi on                                    obj.object_name = edi. edition_name                                              left join
  dba_external_locations  ext on obj.owner = ext.         owner and obj.object_name = ext.   table_name                                              left join
  dba_indexes             ind on obj.owner = ind.         owner and obj.object_name = ind.   index_name                                              left join
--dba_lob                                                                                  
  dba_queues              que on obj.owner = que.         owner and obj.object_name = que.         name                                              left join
  dba_sequences           seq on obj.owner = seq.sequence_owner and obj.object_name = seq.sequence_name                                              left join
  dba_synonyms            syn on obj.owner = syn.         owner and obj.object_name = syn. synonym_name                                              left join
  dba_tab_partitions      tpt on obj.owner = tpt.   table_owner and obj.object_name = tpt.   table_name and obj.subobject_name = tpt.partition_name  left join
  dba_tables              tab on obj.owner = tab.         owner and obj.object_name = tab.   table_name                                              left join
  dba_types               typ on obj.owner = typ.         owner and obj.object_name = typ.    type_name                                              left join
  dba_views               vie on obj.owner = vie.         owner and obj.object_name = vie.    view_name                                              left join
  --
  dba_directories         exd on ext.directory_owner = exd.owner           and
                                 ext.directory_name  = exd.directory_name
where
  -- obj.owner      =     '???' and
  -- obj.object_name like '???%'
order by
  case when obj.object_type in (
    'CLUSTER', 'DIRECTORY', 'EDITION', 'INDEX', 'LOB', 'PACKAGE', 'PACKAGE BODY', 'QUEUE', 'SEQUENCE', 'SYNONYM', 'TABLE', 'TYPE', 'VIEW')
   then 1 else 0 end,
  obj_owner,
  obj_name
;
