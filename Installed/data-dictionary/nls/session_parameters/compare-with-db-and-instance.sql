select
  lower(db.parameter  )  param_name,
  lower(max(db.value ))  database_value,
  lower(max(it.value ))  instance_value,
  lower(max(se.value ))  session_value
from
  nls_database_parameters db                                left join
  nls_instance_parameters it on db.parameter = it.parameter left join
  nls_session_parameters  se on db.parameter = se.parameter
group by
  db.parameter
order by
  db.parameter;
