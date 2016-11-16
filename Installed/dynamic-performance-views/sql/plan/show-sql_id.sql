with p  (  sql_id,   id,   operation,   options,   object_owner,   object_name,   object_alias, lvl) as (
  select
          p.sql_id, p.id, p.operation, p.options, p.object_owner, p.object_name, p.object_alias,   0
    from v$sql_plan p
   where p.sql_id = '29m0un7am4sr6' and
         p.parent_id is null
union all
    select c.sql_id, c.id, c.operation, c.options, c.object_owner, c.object_name, c.object_alias, p.lvl+1
    from p  join v$sql_plan c
      on p.sql_id = c.sql_id and
         p.id     = c.parent_id
)
search depth first by id set "dummy"
select
  lpad('|  ', p.lvl*3, '|  ') || p.operation || ' ' || p.options operation,
  p.object_name,
  p.object_owner,
  p.object_alias,
  p.id,
  p.lvl + 1
from p;
