select
  lower(shi.class      ) hint_class,
  lower(shi.name       ) hint_name,
  lower(shi.inverse    ) inverse_hint_name,
  fea.description        description,
  lower(shi.sql_feature) feature
from
  v$sql_hint     shi                                      left join
  v$sql_feature  fea on shi.sql_feature = fea.sql_feature
order by
  shi.class,
  shi.name
;
