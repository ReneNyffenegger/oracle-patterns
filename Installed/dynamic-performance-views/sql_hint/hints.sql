select
  lower(name       ) name,
  lower(sql_feature) sql_feature,
  lower(class      ) class,
  lower(inverse    ) inverse
from
  v$sql_hint
order by  1;
