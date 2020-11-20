with rec (feature, lvl) as (
   select
      sql_feature as feature,
      0           as lvl
   from
      v$sql_feature_hierarchy
   where
      parent_id is null and
      sql_feature in (select parent_id from v$sql_feature_hierarchy where parent_id is not null)
 UNION ALL
   select
      hir.sql_feature  as feature,
      rec.lvl + 1      as lvl
   from
      rec                              join
      v$sql_feature_hierarchy hir on  rec.feature = hir.parent_id
)
search depth first by feature set order_by
select
  rpad('| ', lvl*2, '| ' ) || replace(feature, 'QKSFM_', '| ')
from
   rec
order by
   order_by;
