column b_conc format a30

select
   a,
   tq84_text_range(b) b_conc
from
   tq84_agg_test 
group by
   a;
--
--         A B_CONC
------------ ------------------------------
--         1 colporteur .. skimmington
--         2 bergschrund .. suedehead
--         3 apoptosis .. xenology
