select /*+ parallel(16) */
  obj.owner,
  obj.object_name,
  obj.object_type,
--sdt.tableobj#,
--sdt.partitionobj#,
  sdt.dmloperation,
  sdt.scn,
  sdt.timestamp,
  sdt.lowrowid,
  sdt.highrowid,
  sdt.sequence,
  sdt.xid
from
  all_sumdelta  sdt   left join
  dba_objects   obj on sdt.tableobj# = obj.object_id
where
  sdt.timestamp <= sysdate  -- ???
order by
  sdt.timestamp desc;
