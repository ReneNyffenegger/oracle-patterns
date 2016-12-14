--
--    https://asktom.oracle.com/pls/asktom/f?p=100:11:::::P11_QUESTION_ID:510622111991
--
create table tq84_t1(
    x int,
    y long
); 

create table tq84_t2(
  x int,
  y clob
); 

insert into tq84_t1 values(1, rpad('*',4000,'*')); 

insert into tq84_t2  select x, to_lob(y) from tq84_t1; 

begin
  insert into tq84_t2 select x, to_lob(y) from tq84_t1;
end;
/

column y_ format a100 
select
  x,
  substr(y, 1, 100) y_
from
  tq84_t2;

drop table tq84_t1;
drop table tq84_t2;
