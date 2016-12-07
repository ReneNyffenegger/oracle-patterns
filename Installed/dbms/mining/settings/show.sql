select
  owner,
  model_name,
  setting_name,
  setting_value,
  setting_type
from
  dba_mining_model_settings
order by
  owner,
  model_name,
  setting_name;
