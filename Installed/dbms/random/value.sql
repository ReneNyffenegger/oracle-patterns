create table tq84_random_value (
  val number
);

insert into tq84_random_value
select
  dbms_random.value(8, 12)
from
  dual
connect by
  level <= 100;

select
  min(val) min_val,
  max(val) max_val,
  avg(val) avg_val
from
  tq84_random_value;

drop table tq84_random_value purge;
