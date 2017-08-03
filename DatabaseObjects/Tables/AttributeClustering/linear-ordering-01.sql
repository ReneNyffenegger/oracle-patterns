create table tq84_dimension (
  id      number primary key,
  flag_1  varchar2(2) not null,
  flag_2  varchar2(2) not null,
  col_1   varchar2(20),
  col_2   varchar2(20),
  col_3   varchar2(50)
)
clustering
  by linear order (
    flag_1,
    flag_2
  );


create table tq84_fact (
  id           number primary key,
  dimension_id not null references tq84_dimension,
  fact_1       varchar2(50),
  fact_2       varchar2(50),
  fact_3       varchar2(50)
)
clustering
  tq84_fact join tq84_dimension on (tq84_fact.dimension_id = tq84_dimension.id)
  by linear order (
    tq84_dimension.col_1,
    tq84_dimension.col_2,
    tq84_fact.fact_1,
    tq84_fact.fact_2
);
  

select
  table_name,
  clustering_type,
  on_load,
  on_datamovement
from
  user_clustering_tables
where
  table_name like 'TQ84_%';


drop table tq84_fact      purge;
drop table tq84_dimension purge;
