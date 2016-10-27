-- 
-- Find resource names that are also init params
--
select
  rl.resource_name
from
  v$resource_limit  rl join
  v$parameter       pm on rl.resource_name = pm.name
order by
  rl.resource_name;
--
-- dml_locks
-- max_shared_servers
-- parallel_max_servers
-- processes
-- sessions
-- transactions
