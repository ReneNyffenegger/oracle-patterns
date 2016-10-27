select
  lower(keyword) keyword,
  reserved,
  res_type,
  res_attr,
  res_semi,
  duplicate
from
  v$reserved_words order by keyword;
