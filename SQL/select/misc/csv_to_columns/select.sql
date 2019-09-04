select
   trim(',' from regexp_substr(csv_line, '^[^,]*' ,1, 1)) col_1,
   trim(',' from regexp_substr(csv_line, ',[^,]*' ,1, 1)) col_2,
   trim(',' from regexp_substr(csv_line, ',[^,]*' ,1, 2)) col_3,
   trim(',' from regexp_substr(csv_line, ',[^,]*' ,1, 3)) col_4
from
   tq84_csv_data;
--
-- COL_1      COL_2      COL_3      COL_4
-- ---------- ---------- ---------- ----------
-- one        two        three      four
-- foo        bar        baz        qux
-- 1                     3
-- i          ii         iii        iv
--            **         ***        ****
