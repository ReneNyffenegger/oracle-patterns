create table tq84_random_normal (
  val number
);

insert into tq84_random_normal
  select
    dbms_random.normal
  from
    dual
  connect by level <= 10000;

select
   avg     (val) avg_val,
   median  (val) median_val,
   variance(val) var_val,
   var_pop (val) var_pop_val,
   var_samp(val) var_samp_val
from
  tq84_random_normal;

drop table tq84_random_normal purge;
