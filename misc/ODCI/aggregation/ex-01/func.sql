create or replace function tq84_text_range(
    value varchar2  -- The value to be aggregated per group
) return varchar2
    parallel_enable
    aggregate
using
  tq84_text_range_t;
/
