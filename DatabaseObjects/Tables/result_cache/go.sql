create table tq84_result_cache_force (
  id     number primary key,
  col_1  varchar2(10),
  col_2  varchar2(10)
)
result_cache(mode force);

create table tq84_result_cache_default (
  id     number primary key,
  col_1  varchar2(10),
  col_2  varchar2(10)
)
result_cache(mode default);


select
  table_name,
  result_cache
from
  user_tables where table_name like 'TQ84_RESULT_CACHE_%';
  
drop table tq84_result_cache_force;
drop table tq84_result_cache_default;
