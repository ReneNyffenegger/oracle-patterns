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
   to_char(avg     (val), '90.9999') avg_val,
   to_char(median  (val), '90.9999') median_val,
   to_char(variance(val), '90.9999') var_val,
   to_char(var_pop (val), '90.9999') var_pop_val,
   to_char(var_samp(val), '90.9999') var_samp_val,
   --
   to_char(min     (val), '90.9999') min_val,
   to_char(max     (val), '90.9999') max_val
from
  tq84_random_normal;

drop table tq84_random_normal purge;
