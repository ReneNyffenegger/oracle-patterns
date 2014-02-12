create table tq84_a(u number);
create table tq84_b(v number);

insert into tq84_a values(1);
insert into tq84_a values(2);

insert into tq84_b values(1);

prompt
prompt *** 1 ***

select   
   u, v
 from    
   tq84_a , tq84_b
where
   u = 2 and
   u = v(+)            -- => selects one record
;

prompt
prompt *** 2 ***

select     
   u, v
 from 
   tq84_a, tq84_b
where 
   u = 2    and 
   2 = v(+)            -- => selects no record
;


prompt
prompt *** 3 ***

select
  u, v
from
  tq84_a left join 
  tq84_b on v = 2      -- => selects two records
;


drop table tq84_a purge;
drop table tq84_b purge;
