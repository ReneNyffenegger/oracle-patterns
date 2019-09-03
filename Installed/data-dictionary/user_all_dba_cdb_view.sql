create or replace view user_all_dba_cdb_v as
with u as ( select substr(object_name, 6) obj, object_name from dba_objects where owner = 'SYS' and object_name like 'USER\_%' escape '\'),
     a as ( select substr(object_name, 5) obj, object_name from dba_objects where owner = 'SYS' and object_name like  'ALL\_%' escape '\'),
     d as ( select substr(object_name, 5) obj, object_name from dba_objects where owner = 'SYS' and object_name like  'DBA\_%' escape '\'),
     c as ( select substr(object_name, 5) obj, object_name from dba_objects where owner = 'SYS' and object_name like  'CDB\_%' escape '\'),
     o as ( select obj from u union
            select obj from a union
            select obj from d union
            select obj from c)
select
  nvl2(u.obj, 'USER', '-') u,
  nvl2(a.obj, 'ALL' , '-') a,
  nvl2(d.obj, 'DBA' , '-') d,
  nvl2(d.obj, 'CDB' , '-') c,
       o.obj               o,
--  replace(
--  replace(
--  replace(
--  replace(cu.comments, ' owned by the user' , ''),
--                       ' relational tables''s', ' relational tables'),
--                       ' in all containers'   , ''                  ),
--                       ' to the current user' , ''                  ) comment_user,
--  --
--  replace(
--  replace(ca.comments, ' accessible to the user' , ''),
--                       ' to the user'            , '') comment_all,
--  --
--  replace(cd.comments, ' owned by the user' , '') comment_dba,
--  --
--  replace(
--  replace(cc.comments, ' in all containers' , ''),
--                       ' owned by the user' , '') comment_cdb,    --  AW_PS
   cu.comments cu,
   ca.comments ca,
   cd.comments cd,
   cc.comments cc
from
                    o                                    left join
                    u on o.obj         = u.obj           left join
                    a on o.obj         = a.obj           left join
                    d on o.obj         = d.obj           left join
                    c on o.obj         = c.obj           left join
  dba_tab_comments cu on u.object_name = cu.table_name   left join
  dba_tab_comments ca on a.object_name = ca.table_name   left join
  dba_tab_comments cd on d.object_name = cd.table_name   left join
  dba_tab_comments cc on c.object_name = cc.table_name
order by
  o.obj;
