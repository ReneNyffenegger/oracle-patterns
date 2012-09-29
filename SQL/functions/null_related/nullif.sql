with expr as (
  select 'foo' val from dual union all
  select 'baz' val from dual union all
  select 'bar' val from dual union all
  select  null val from dual
)
select
  first.val, second.val, 
  nullif(first.val, second.val) "Null if equal, first otherwise",
  case when first.val = second.val then null else first.val end "same same"
from
  expr first, expr second
where
  first.val is not null;
