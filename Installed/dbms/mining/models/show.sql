select
  owner,
  model_name,
  mining_function,
  algorithm,
  creation_date,
  build_duration,
  model_size,
  comments
from
  dba_mining_models
order by
  owner,
  model_name;
