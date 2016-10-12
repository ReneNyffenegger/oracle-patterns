select
  name,
  detected_usages,
  currently_used,
  description,
  first_usage_date,
  last_usage_date
from
  dba_feature_usage_statistics
where
  version = '11.2.0.3.0';
