create or replace function tq84_listagg_f(
   value     varchar2,
   separator varchar2
) return clob
  parallel_enable
  aggregate using tq84_listagg_t;
