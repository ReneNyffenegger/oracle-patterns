create table tq84_parallel_degree_default (
  id    number primary key,
  col_1 varchar2(10) not null,
  col_2 varchar2(10)
)
parallel (degree default);


create table tq84_parallel_16 (
  id    number primary key,
  col_1 varchar2(10) not null,
  col_2 varchar2(10)
)
parallel 16;


select
  table_name,
  degree
from
  user_tables
where
  table_name like 'TQ84%';
