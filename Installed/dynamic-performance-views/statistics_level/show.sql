select
  statistics_name,
  description,
  statistics_view_name
from
  v$statistics_level
order by
  lower(statistics_name);
