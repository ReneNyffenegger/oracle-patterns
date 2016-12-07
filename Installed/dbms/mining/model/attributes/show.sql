select
  owner,
  model_name,
  attribute_name,
  attribute_type,
  data_type,
  data_length,
  data_precision,
  data_scale,
  usage_type,
  target,
  attribute_spec
from
  dba_mining_model_attributes
order by
  owner,
  model_name,
  attribute_name;
