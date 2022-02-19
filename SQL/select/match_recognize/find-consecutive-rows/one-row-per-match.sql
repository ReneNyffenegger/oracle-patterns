select * from  tq84_consecutive_rows
match_recognize (
   order by id
   measures
     min(id)       start_id,
     max(id)       end_id
   pattern (R C*)
   define C as id = prev(id) + 1
);
-- 
--   START_ID     END_ID
-- ---------- ----------
--          1          3
--          5          5
--          8         11
--         20         20
