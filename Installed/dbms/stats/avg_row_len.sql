--
--  db_block_size: 8192
--

create table tq84_avg_row_len (
  text_1  varchar2(1000),
  text_2  varchar2(1000),
  dt      date    
);



insert into tq84_avg_row_len values (lpad('*',  50, '*'), lpad('!',  100, '!') , sysdate + 1000);
insert into tq84_avg_row_len values (lpad('*', 421, '*'), null                 , null          );
insert into tq84_avg_row_len values (null               , null                 , null          );
insert into tq84_avg_row_len values (lpad('*', 800, '*'), lpad('!',    4, '!') , sysdate - 1000);
insert into tq84_avg_row_len values (lpad('*',   7, '*'), lpad('!',  896, '!') , null          );
insert into tq84_avg_row_len values (lpad('*', 139, '*'), null                 , sysdate       );
insert into tq84_avg_row_len values (lpad('*',  26, '*'), lpad('!',   39, '!') , sysdate       );

select sum(

   1                                         + -- for each row
   --------------------------------------
   nvl2(text_1, vsize(text_1)+1, 0)          + 
   nvl2(text_2, vsize(text_2)+1, 0)          +
   nvl2(dt    , vsize(dt    )  , 0)
-- case when dt is null then 0 else 7 end       -- A date occupies 7 bytes
   --------------------------------------
  ) / count(*) avg_row_len
from
  tq84_avg_row_len;


exec dbms_stats.gather_table_stats(user, 'tq84_avg_row_len', method_opt => 'for all columns');

select
  avg_row_len
from
  user_tables
where
  table_name = 'TQ84_AVG_ROW_LEN';


drop table tq84_avg_row_len purge;
