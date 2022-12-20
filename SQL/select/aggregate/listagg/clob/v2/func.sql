create or replace function tq84_listagg_f(
   rec       tq84_listagg_rec,
   separator varchar2
)
return clob authid definer
-- parallel_enable
   aggregate using tq84_listagg_t;
/
