create table tq84_clustering (
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
  
select * from user_tables where clustering = 'YES';

drop table tq84_clustering;
