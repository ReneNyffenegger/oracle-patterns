with rec (feature, lvl) as (
   select
      sql_feature as feature,
      0                                  as lvl
   from
      v$sql_feature_hierarchy
   where
      parent_id is null and
      sql_feature in (select parent_id from v$sql_feature_hierarchy where parent_id is not null)
 UNION ALL
   select
      hir.sql_feature  as feature,
      rec.lvl + 1  as lvl
   from
      rec                                                           join
      v$sql_feature_hierarchy hir on  rec.feature = hir.parent_id
)
search depth first by feature set order_by,
b as (
select
   case when nvl(lag(feature) over (order by order_by, hin.class nulls last, hin.name), chr(0)) != feature then 1 end new_feature,
   rec.feature,
   fet.description,
   hin.name            hint_name,
   hin.class           hint_class,
   hin.version         hint_version,
   rec.order_by,
   rec.lvl
from
   rec                                                  join
   v$sql_feature fet on rec.feature = fet.sql_feature   join
   v$sql_hint    hin on rec.feature = hin.sql_feature
)
select
   case when new_feature = 1 then rpad(' ', lvl*3 ) || replace(feature, 'QKSFM_', '') end feature,
   case when new_feature = 1 then description                                         end description,
   hint_name,
   hint_class,
   hint_version
from
   b
order by
   order_by,
   hint_class nulls last,
   hint_name;
