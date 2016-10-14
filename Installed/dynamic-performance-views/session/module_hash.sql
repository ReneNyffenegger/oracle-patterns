select
  module, 
  module_hash,
  ora_hash(module)
from
  v$session
where
  module_hash != ora_hash(module);
