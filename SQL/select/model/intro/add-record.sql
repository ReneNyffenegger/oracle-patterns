select
   *
from
   tq84_model_clause
model
   dimension by ( row_ )
   measures     ( col_1, col_2, col_3, col_4, col_5 )
   (
      col_1[ 7 ] = 101,
      col_2[ 7 ] = 102,
      col_3[ 7 ] = 103
   )
;
