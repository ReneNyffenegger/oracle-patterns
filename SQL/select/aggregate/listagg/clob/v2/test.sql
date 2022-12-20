select
   tq84_listagg_f(tq84_listagg_rec(object_name, object_id),  ' - ')
from
   user_objects
;

select
   tq84_listagg_f(tq84_listagg_rec(column_name, -column_id),  ',')
from
   user_tab_columns 
;
