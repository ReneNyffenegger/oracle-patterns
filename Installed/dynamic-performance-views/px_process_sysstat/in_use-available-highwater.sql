with px_process_sysstat as (
  select
    max(case when trim(statistic) = 'Servers In Use'    then value end) servers_in_use,
    max(case when trim(statistic) = 'Servers Available' then value end) servers_available,
    max(case when trim(statistic) = 'Servers Highwater' then value end) servers_highwater
  from
    v$px_process_sysstat
),
px_process as (
  select
    sum(case when status = 'IN USE'    then 1 end) sum_in_use,
    sum(case when status = 'AVAILABLE' then 1 end) sum_available
  from
    v$px_process
),
init_param as (
  select
    value           parallel_max_servers
  from
    v$parameter
  where
    name = 'parallel_max_servers'
)
select
  prs.servers_in_use,
  prc.sum_in_use,              -- Always = servers_in_use + 3 ?
  prs.servers_available,
  prc.sum_available,
  prs.servers_highwater,
  ini.parallel_max_servers
from
  px_process_sysstat prs cross join
  px_process         prc cross join
  init_param         ini;
