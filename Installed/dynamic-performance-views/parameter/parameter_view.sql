create or replace view parameter_view as
select
  case when status = 'Obsolete' or isdeprecated = 'TRUE' then 'FALSE' else 'TRUE' end not_obsolete,
  status,
  isdeprecated,
  isbasic,
  name,
  type_,
  default_value,
  description,
  isses_modifiable,
  issys_modifiable,
  ispdb_modifiable,
  isinstance_modifiable
from (
  select
    max(status               ) status,
    max(isdeprecated         ) isdeprecated,
    max(isbasic              ) isbasic     ,
        name                         ,
    max(type_                ) type_ ,
    max(default_value        ) default_value,
    max(description          ) description,
    max(isses_modifiable     ) isses_modifiable,
    max(issys_modifiable     ) issys_modifiable,
    max(ispdb_modifiable     ) ispdb_modifiable,
    max(isinstance_modifiable) isinstance_modifiable
  from (
    select 'OK'       status, isdeprecated,  name         , isbasic, null type_, default_value, description                                      , isses_modifiable, issys_modifiable, ispdb_modifiable, isinstance_modifiable from v$parameter          union all
    select 'Obsolete' status, null        ,  name         , null   , null type_, null         , null                                             , null            , null            , null            , null                  from v$obsolete_parameter union all
    select '?'        status, null        ,  name         , null   , type type_, null         , null                                             , null            , null            , null            , null                  from v$spparameter        union all
    select '?'        status, null        , '_fix_control', null   , null type_, null         ,'See v$session_fix_control, v$system_fix_control' , null            , null            , null            , null                  from dual
  )
  group by
    name
)
  order by
    replace(lower(name), '_','')
;
