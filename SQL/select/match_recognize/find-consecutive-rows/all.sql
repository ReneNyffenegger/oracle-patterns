select * from  tq84_consecutive_rows
match_recognize (
   order by id
   measures
      match_number()    match_no,
      first(id)         start_id,
      final last(id)      end_id
   all rows per match
   pattern (R C*)
   define C as id = prev(id) + 1
);
--
--         ID   MATCH_NO   START_ID     END_ID TXT                 
-- ---------- ---------- ---------- ---------- --------------------
--          1          1          1          3 one                 
--          2          1          1          3 two                 
--          3          1          1          3 three               
--          5          2          5          5 five                
--          8          3          8         11 eight               
--          9          3          8         11 nine                
--         10          3          8         11 ten                 
--         11          3          8         11 eleven              
--         20          4         20         20 twenty            
