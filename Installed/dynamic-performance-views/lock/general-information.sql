with lock_mode as (
   select 0 id, ''              descr from dual union all
   select 1 id, 'NULL'          descr from dual union all
   select 2 id, 'row-S (SS)'    descr from dual union all
   select 3 id, 'row-X (SX)'    descr from dual union all
   select 4 id, 'share (S)'     descr from dual union all
   select 5 id, 'S/Row-X (SSX)' descr from dual union all
   select 6 id, 'exclusive (X)' descr from dual
)
select
   ob1.owner                               obj_1_owner,
   ob1.object_name                         obj_1_name,
   ob2.owner                               obj_2_owner,
   ob2.object_name                         obj_2_name,
   lck.sid,
   lmh.descr                               lock_mode_held_by_session,
   nvl(lmr.descr, lck.request)             lock_mode_requested_by_process,
   ---
   case lkt.id1_tag
        when 'object #'  then 
              ob1.owner || '.' ||
              ob1.object_name ||
              ' (' || ob1.object_type || ')'
        else lkt.id1_tag || ': ' || lck.id1        
   end                                     id1,
   case lkt.id2_tag
        when 'object #'  then 
              ob2.owner || '.' ||
              ob2.object_name ||
              ' (' || ob2.object_type || ')'
        else lkt.id2_tag || ': ' || lck.id2        
   end                                     id2,
   decode(lck.block,
     0, 'not blocking other processes',
     1,     'blocking other processes',
     2,     'not blocking on local node',
            '? ' || lck.block)             lock_blocking,
   lck.type                                lock_type,
   lkt.name                                lock_type_name,
   lck.ctime                               lock_granted_cs_ago,
   lkt.description                         lock_type_description,
   lkt.id1_tag,
   lkt.id2_tag,
   lkt.is_user,
-- lck.con_id                              lock_container_id,
-- lkt.con_id                              lock_type_container_id,
-- lkt.is_recycle,
   ses.osuser,
   ses.username,
   ses.logon_time,
   lck.addr,
   lck.kaddr
from
   v$lock                 lck                                 left join
   v$lock_type            lkt on lck.type    = lkt.type       left join
   lock_mode              lmh on lck.lmode   = lmh.id         left join
   lock_mode              lmr on lck.request = lmr.id         left join
   v$session              ses on lck.sid     = ses.sid        left join
   dba_objects            ob1 on lck.id1     = ob1.object_id  left join
   dba_objects            ob2 on lck.id2     = ob2.object_id
order by
   decode (lck.block, 1, 0, 1)
;
