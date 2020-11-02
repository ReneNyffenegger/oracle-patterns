with cur(owner, name, type, lvl) as (
  select
     obj.owner      ,
     obj.object_name,
     obj.object_type,
     0     lvl
  from
     all_objects obj
  where
     obj.object_name = 'ALL_FILE_GROUP_FILES' /* 'DBMS_DDL' */ and
     obj.object_type = 'SYNONYM'                                    union all
  select
     nxt.referenced_owner,
     nxt.referenced_name ,
     nxt.referenced_type ,
     cur.lvl +1
  from
     cur                   join
     all_dependencies nxt on nxt.owner = cur.owner and
                             nxt.name  = cur.name  and
                             nxt.type  = cur.type
)
search depth first by owner, name, type set order_by
select
   lpad(' ', lvl*2) || owner || '.' || name || ' (' || type || ')'
from
   cur
order by
   order_by
;
--
-- PUBLIC.ALL_FILE_GROUP_FILES (SYNONYM)
--   SYS.ALL_FILE_GROUP_FILES (VIEW)
--     SYS._ALL_FILE_GROUP_FILES (VIEW)
--       SYS.FGR$_FILE_GROUP_FILES (TABLE)
--       SYS.FGR$_FILE_GROUP_VERSIONS (TABLE)
--       SYS._ALL_FILE_GROUPS (VIEW)
--         SYS.FGR$_FILE_GROUPS (TABLE)
--         SYS.OBJ$ (TABLE)
--         SYS.OBJAUTH$ (TABLE)
--         SYS.USER$ (TABLE)
--         SYS.V$ENABLEDPRIVS (VIEW)
--         SYS.X$KZSRO (TABLE)
